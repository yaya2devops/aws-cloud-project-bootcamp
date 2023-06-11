resource "aws_ecs_service" "backend-flask-tf" {
  name                              = "CrdSrvBackendFlask_TF"
  cluster                           = data.terraform_remote_state.cluster.outputs.ClusterId
  task_definition                   = aws_ecs_task_definition.backendTD.arn
  desired_count                     = 1
  launch_type                       = "FARGATE"
  depends_on                        = [aws_iam_role.CrdExecutionRole_TF, aws_iam_role.CrdTaskRole_TF]
  enable_ecs_managed_tags           = true
  enable_execute_command            = true
  propagate_tags                    = "SERVICE"
  health_check_grace_period_seconds = 0

  deployment_controller {
    type = "ECS"
  }

  load_balancer {
    target_group_arn = data.terraform_remote_state.cluster.outputs.backendTG
    container_name   = var.containername
    container_port   = var.containerport
  }

  network_configuration {
    subnets          = data.terraform_remote_state.network.outputs.PubSubIds
    security_groups  = [data.terraform_remote_state.cluster.outputs.ServiceSG]
    assign_public_ip = true
  }

  service_connect_configuration {
    enabled   = true
    namespace = "cruddurtf"
    service {
      client_alias {
        port = var.containerport
      }
      discovery_name = "backend-flask"
      port_name      = var.containername

    }

  }

  tags = {
    Name = "CrdSrvBackendFlask_TF"
  }
}

resource "aws_ecs_task_definition" "backendTD" {
  family                   = var.containername
  cpu                      = var.service_cpu
  execution_role_arn       = aws_iam_role.CrdExecutionRole_TF.arn
  memory                   = var.service_memory
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.CrdTaskRole_TF.arn

  container_definitions = jsonencode([
    {
      "name" : "xray",
      "image" : "public.ecr.aws/xray/aws-xray-daemon",
      "essential" : true,
      "user" : "1337",
      "portMappings" : [
        {
          "name" : "xray",
          "containerPort" : 2000,
          "protocol" : "udp"
        }
      ]
    },
    {
      "name" : "backend-flask",
      "image" : var.backend_image,
      "essential" : true,
      "healthCheck" : {
        "command" : ["CMD-SHELL", "python /backend-flask/bin/health-check"],
        "interval" : 30,
        "timeout" : 5,
        "retries" : 3,
        "startPeriod" : 60
      },
      "portMappings" : [
        {
          "name" : var.containername,
          "containerPort" : var.containerport,
          "protocol" : "tcp",
          "appProtocol" : "http"
        }
      ],
      "logConfiguration" : {
        "logDriver" : "awslogs",
        "options" : {
          "awslogs-group" : "cruddur",
          "awslogs-region" : var.region,
          "awslogs-stream-prefix" : var.containername
        }
      },
      "environment" : [
        { "name" : "OTEL_SERVICE_NAME", "value" : var.OTEL_SERVICE_NAME },
        {
          "name" : "OTEL_EXPORTER_OTLP_ENDPOINT",
          "value" : var.OTEL_EXPORTER_OTLP_ENDPOINT
        },
        { "name" : "FRONTEND_URL", "value" : var.FRONTEND_URL },
        { "name" : "BACKEND_URL", "value" : var.BACKEND_URL },
        { "name" : "AWS_DEFAULT_REGION", "value" : var.region }
      ],
      "secrets" : [
        {
          "name" : "AWS_ACCESS_KEY_ID",
          "valueFrom" : data.aws_ssm_parameter.AWS_ACCESS_KEY_ID.arn
        },
        {
          "name" : "AWS_SECRET_ACCESS_KEY",
          "valueFrom" : data.aws_ssm_parameter.AWS_SECRET_ACCESS_KEY.arn
        },
        {
          "name" : "CONNECTION_URL",
          "valueFrom" : data.aws_ssm_parameter.CONNECTION_URL.arn
        },
        {
          "name" : "ROLLBAR_ACCESS_TOKEN",
          "valueFrom" : data.aws_ssm_parameter.ROLLBAR_ACCESS_TOKEN.arn
        },
        {
          "name" : "OTEL_EXPORTER_OTLP_HEADERS",
          "valueFrom" : data.aws_ssm_parameter.OTEL_EXPORTER_OTLP_HEADERS.arn
        },
        {
          "name" : "AWS_COGNITO_USER_POOL_ID",
          "valueFrom" : data.aws_ssm_parameter.AWS_COGNITO_USER_POOL_ID.arn
        },
        {
          "name" : "AWS_COGNITO_USER_POOL_CLIENT_ID",
          "valueFrom" : data.aws_ssm_parameter.AWS_COGNITO_USER_POOL_CLIENT_ID.arn
        }
      ]
    }
  ])
  tags = {
    Name = "backendTaskDef"
  }
}