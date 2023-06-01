
```sh
$ terraform apply -lock=false
var.certificate_arn
  Enter a value: 

data.terraform_remote_state.network: Reading...

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform planned the following actions, but then encountered a problem:

  # aws_ecs_cluster.CrdFargateCluster will be created
  + resource "aws_ecs_cluster" "CrdFargateCluster" {
      + arn                = (known after apply)
      + capacity_providers = (known after apply)
      + id                 = (known after apply)
      + name               = "CrdFargateCluster"
      + tags_all           = (known after apply)

      + configuration {
          + execute_command_configuration {
              + logging = "DEFAULT"
            }
        }

      + service_connect_defaults {
          + namespace = (known after apply)
        }

      + setting {
          + name  = "containerInsights"
          + value = "enabled"
        }
    }

  # aws_ecs_cluster_capacity_providers.ClusterCapProv will be created
  + resource "aws_ecs_cluster_capacity_providers" "ClusterCapProv" {
      + capacity_providers = [
          + "FARGATE",
        ]
      + cluster_name       = "CrdFargateCluster"
      + id                 = (known after apply)
    }

  # aws_service_discovery_http_namespace.namespace will be created
  + resource "aws_service_discovery_http_namespace" "namespace" {
      + arn         = (known after apply)
      + description = "cruddur tf namespace"
      + http_name   = (known after apply)
      + id          = (known after apply)
      + name        = "cruddurtf"
      + tags_all    = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.
```