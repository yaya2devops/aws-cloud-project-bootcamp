variable "repo" {
  type    = string
  default = "yaya2devops/aws-cloud-project-bootcamp"

}

variable "AWS_DEFAULT_REGION" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ca-central-1"
}


variable "branch" {
  type    = string
  default = "prod"

}

variable "ClusterStack" {
  type = string

}

variable "ServiceStack" {
  type = string

}

variable "codebuild_compute" {
  type    = string
  default = "BUILD_GENERAL1_SMALL"

}

variable "codebuild_image" {
  type    = string
  default = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"

}

variable "buildspec" {
  type    = string
  default = "backend-flask/buildspec.yml"

}
variable "codebuild_queue_timeout" {
  type    = number
  default = 30

}
variable "codebuild_build_timeout" {
  type    = number
  default = 10

}

variable "group_name" {
  type    = string
  default = "/cruddurtf/codebuild/bake-service"

}
variable "stream_name" {
  type    = string
  default = "backend-flask"

}


variable "AccountId" {
  type      = string
  sensitive = true
}
variable "Region" {
  type      = string
  sensitive = true
}


