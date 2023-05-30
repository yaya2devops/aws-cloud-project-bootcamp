resource "aws_ecs_cluster" "CrdFargateCluster" 
{
  name = "CrdFargateCluster"

  setting 
  {
    name  = "containerInsights"
    value = "enabled"
  }

  configuration 
  {
    execute_command_configuration 
    {
      logging = "DEFAULT"
    }
  }

  service_connect_defaults 
  {
    namespace = aws_service_discovery_http_namespace.namespace.arn
  }

}


resource "aws_ecs_cluster_capacity_providers" "ClusterCapProv"
{
  cluster_name       = aws_ecs_cluster.CrdFargateCluster.name
  capacity_providers = ["FARGATE"]
}

resource "aws_service_discovery_http_namespace" "namespace" 
{
  name        = "cruddurtf"
  description = "cruddur tf namespace"
}