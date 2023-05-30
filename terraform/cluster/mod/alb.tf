resource "aws_lb" "crdALB" {
  name               = "crdALB-TF"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  security_groups    = [aws_security_group.ALBSG.id]
  subnets            = [for subnet in data.terraform_remote_state.network.outputs.PubSubIds : subnet]

  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = true

  tags = {
    Environment = "production"
  }
}

resource "aws_security_group" "ALBSG" {
  name   = "ALBSG_TF"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "Internet_HTTPS" {
  security_group_id = aws_security_group.ALBSG.id

  description = "Internet HTTPS"
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}
resource "aws_vpc_security_group_ingress_rule" "Internet_HTTP" {
  security_group_id = aws_security_group.ALBSG.id

  description = "Internet HTTP"
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_egress_rule" "ALBSG_egress" {
  security_group_id = aws_security_group.ALBSG.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}
resource "aws_lb_listener" "HTTPSList" {
  load_balancer_arn = aws_lb.crdALB.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontendTG.arn
  }
}


resource "aws_lb_listener" "HTTPList" {
  load_balancer_arn = aws_lb.crdALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
      host        = "#{host}"
      path        = "/#{path}"
      query       = "#{query}"
    }
  }
}

resource "aws_lb_listener_rule" "API_ALB_Listerner_Rule" {
  listener_arn = aws_lb_listener.HTTPSList.arn
  priority     = 1

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backendTG.arn
  }

  condition {
    host_header {
      values = ["testapi.annleefores.cloud"]
    }
  }
}