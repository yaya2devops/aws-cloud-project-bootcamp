resource "aws_iam_role" "CrdExecutionRole_TF" {
  name = "CrdExecutionRole_TF"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })

  inline_policy {
    name = "CruddurExecutionPolicy_ecr_tf"

    policy = jsonencode(
      {
        "Version" : "2012-10-17",
        "Statement" : [
          {
            "Action" : [
              "ecr:GetAuthorizationToken",
              "ecr:BatchCheckLayerAvailability",
              "ecr:GetDownloadUrlForLayer",
              "ecr:BatchGetImage",
              "logs:CreateLogStream",
              "logs:PutLogEvents"
            ],
            "Resource" : "*",
            "Effect" : "Allow",
            "Sid" : "VisualEditor0"
          },
          {
            "Action" : [
              "ssm:GetParameters",
              "ssm:GetParameter"
            ],
            "Resource" : "arn:aws:ssm:${var.region}:${var.AWS_ACCOUNT_ID}:parameter/cruddur/${var.containername}/*",
            "Effect" : "Allow",
            "Sid" : "VisualEditor1"
          }
        ]
      }
    )
  }

  managed_policy_arns = ["arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"]

}

resource "aws_iam_role" "CrdTaskRole_TF" {
  name = "CrdTaskRole_TF"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })

  inline_policy {
    name = "CrdTaskPolicy_ssm_msg_tf"

    policy = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : [
            "ssmmessages:CreateControlChannel",
            "ssmmessages:CreateDataChannel",
            "ssmmessages:OpenControlChannel",
            "ssmmessages:OpenDataChannel"
          ],
          "Resource" : "*",
          "Effect" : "Allow",
          "Sid" : "VisualEditor0"
        }
      ]
    })
  }

  managed_policy_arns = ["arn:aws:iam::aws:policy/CloudWatchLogsFullAccess", "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess"]

}