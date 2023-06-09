data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "codepipeline_role" {
  name               = "crdPipeRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  inline_policy {
    name   = "ecs_inline_policy"
    policy = data.aws_iam_policy_document.ecs_inline_policy.json
  }
  inline_policy {
    name   = "codestar_inline_policy"
    policy = data.aws_iam_policy_document.codestar_inline_policy.json
  }
  inline_policy {
    name   = "codepipeline_inline_policy"
    policy = data.aws_iam_policy_document.codepipeline_inline_policy.json
  }
  inline_policy {
    name   = "codebuild_inline_policy"
    policy = data.aws_iam_policy_document.codeBuild_inline_policy.json
  }
}

data "aws_iam_policy_document" "ecs_inline_policy" {
  statement {
    actions = ["ecs:DescribeServices",
      "ecs:DescribeTaskDefinition",
      "ecs:DescribeTasks",
      "ecs:ListTasks",
      "ecs:RegisterTaskDefinition",
    "ecs:UpdateService"]
    resources = ["*"]
    effect    = "Allow"
  }
}
data "aws_iam_policy_document" "codestar_inline_policy" {
  statement {
    actions   = ["codestar-connections:UseConnection"]
    resources = [aws_codestarconnections_connection.gh_codestar.id]
    effect    = "Allow"
  }
}
data "aws_iam_policy_document" "codepipeline_inline_policy" {
  statement {
    actions = ["s3:*",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "iam:PassRole",
      "iam:CreateRole",
      "iam:DetachRolePolicy",
      "iam:DeleteRolePolicy",
      "iam:PutRolePolicy",
      "iam:DeleteRole",
      "iam:AttachRolePolicy",
      "iam:GetRole",
      "iam:PassRole",
    ]
    resources = ["*"]
    effect    = "Allow"
  }
}
data "aws_iam_policy_document" "codeBuild_inline_policy" {
  statement {
    actions = [
      "codebuild:StartBuild",
      "codebuild:StopBuild",
      "codebuild:RetryBuild",
      "codebuild:BatchGetBuilds",
    ]
    resources = ["arn:aws:codebuild:${var.Region}:${var.AccountId}:project/${aws_codebuild_project.crd_codebuild.name}"]
    effect    = "Allow"
  }
}