resource "aws_codebuild_project" "crd_codebuild" {
  name           = "crd_codebuild_tf"
  build_timeout  = var.codebuild_build_timeout
  queued_timeout = var.codebuild_queue_timeout
  service_role   = aws_iam_role.codebuildrole_tf.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type    = var.codebuild_compute
    image           = var.codebuild_image
    type            = "LINUX_CONTAINER"
    privileged_mode = true
  }


  source {
    type            = "GITHUB"
    buildspec       = var.buildspec
    git_clone_depth = 1
    location        = "https://github.com/yaya2devops/aws-cloud-project-bootcamp.git"
  }

  logs_config {
    cloudwatch_logs {
      group_name  = var.group_name
      status      = "ENABLED"
      stream_name = var.stream_name
    }
  }

  tags = {
    Environment = "dev"
    Name        = "crd_codebuild_tf"
  }
}

resource "aws_codebuild_webhook" "codebuild_webhook" {
  project_name = aws_codebuild_project.crd_codebuild.name
  build_type   = "BUILD"
  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PULL_REQUEST_MERGED"
    }

  }
}


resource "aws_iam_role" "codebuildrole_tf" {
  name               = "codebuildrole_tf"
  assume_role_policy = data.aws_iam_policy_document.assume_role_codebuild.json

  inline_policy {
    name   = "ecr_inline_policy"
    policy = data.aws_iam_policy_document.ecr_inline_policy.json
  }

  inline_policy {
    name   = "vpc_inline_policy"
    policy = data.aws_iam_policy_document.vpc_inline_policy.json
  }
  inline_policy {
    name   = "logs_inline_policy"
    policy = data.aws_iam_policy_document.logs_inline_policy.json
  }
  inline_policy {
    name   = "ssm_inline_policy"
    policy = data.aws_iam_policy_document.ssm_inline_policy.json
  }
  inline_policy {
    name   = "s3_inline_policy"
    policy = data.aws_iam_policy_document.s3_inline_policy.json
  }

}

data "aws_iam_policy_document" "assume_role_codebuild" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "ecr_inline_policy" {
  statement {
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:CompleteLayerUpload",
      "ecr:GetAuthorizationToken",
      "ecr:InitiateLayerUpload",
      "ecr:BatchGetImage",
      "ecr:GetDownloadUrlForLayer",
      "ecr:PutImage",
      "ecr:UploadLayerPart",
    ]
    resources = ["*"]
    effect    = "Allow"
  }
}

data "aws_iam_policy_document" "ssm_inline_policy" {
  statement {
    actions = [
      "ssm:GetParameters"
    ]
    resources = ["arn:aws:ssm:${var.Region}:${var.AccountId}:parameter/cruddur*"]
    effect    = "Allow"
  }
}
data "aws_iam_policy_document" "s3_inline_policy" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation"
    ]
    resources = ["arn:aws:s3:::tf-codepipeline-artifacts-yaya/*"]
    effect    = "Allow"
  }
}

data "aws_iam_policy_document" "vpc_inline_policy" {
  statement {
    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeDhcpOptions",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
      "ec2:DescribeSubnets",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeVpcs",
    ]
    resources = ["*"]
    effect    = "Allow"
  }
  statement {
    actions   = ["ec2:CreateNetworkInterfacePermission"]
    resources = ["*"]
    effect    = "Allow"
  }
}


data "aws_iam_policy_document" "logs_inline_policy" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = ["arn:aws:logs:${var.Region}:${var.AccountId}:log-group:${var.group_name}*", "arn:aws:logs:${var.Region}:${var.AccountId}:log-group:${var.group_name}:*"]
    effect    = "Allow"
  }
}