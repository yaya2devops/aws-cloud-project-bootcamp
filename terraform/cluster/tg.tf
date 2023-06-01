resource "aws_lb_target_group" "backendTG" {
  name                 = "backendTG-tf"
  port                 = var.BackendPort
  protocol             = "HTTP"
  protocol_version     = "HTTP2"
  target_type          = "ip"
  ip_address_type      = "ipv4"
  vpc_id               = data.terraform_remote_state.network.outputs.vpc_id
  deregistration_delay = 0

  health_check {
    enabled             = true
    healthy_threshold   = var.BackendHealthy_threshold
    unhealthy_threshold = var.BackendUnhealthy_threshold
    interval            = var.BackendInterval
    matcher             = 200
    path                = var.BackendPath
    protocol            = "HTTP"
    timeout             = var.BackendTimeout
  }

  tags = {
    Name = "BackendTG"
  }
}

resource "aws_lb_target_group" "frontendTG" {
  name                 = "frontendTG-tf"
  port                 = var.FrontendPort
  protocol             = "HTTP"
  protocol_version     = "HTTP2"
  target_type          = "ip"
  ip_address_type      = "ipv4"
  vpc_id               = data.terraform_remote_state.network.outputs.vpc_id
  deregistration_delay = 0

  health_check {
    enabled             = true
    healthy_threshold   = var.FrontendHealthy_threshold
    unhealthy_threshold = var.FrontendUnhealthy_threshold
    interval            = var.FrontendInterval
    matcher             = 200
    path                = var.FrontendPath
    protocol            = "HTTP"
    timeout             = var.FrontendTimeout
  }

  tags = {
    Name = "FrontendTG"
  }
}
