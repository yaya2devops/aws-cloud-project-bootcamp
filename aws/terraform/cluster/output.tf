output "backendTG" {
  value = aws_lb_target_group.backendTG.arn
}

output "frontendTG" {
  value = aws_lb_target_group.frontendTG.arn
}

output "ALBSG" {
  value = aws_security_group.ALBSG.id

}


output "ClusterId" {
  value = aws_ecs_cluster.CrdFargateCluster.id
}
