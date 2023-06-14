variable "containername" {
  type    = string
  default = "backend-flask"
}

variable "containerport" {
  type    = number
  default = 4567
}

variable "backend_image" {
  type    = string
  default = "598485450821.dkr.ecr.ca-central-1.amazonaws.com/backend-flask"
}

variable "region" {
  type    = string
  default = "ca-central-1"

}

variable "OTEL_SERVICE_NAME" {
  type    = string
  default = "backend-flask"

}
variable "OTEL_EXPORTER_OTLP_ENDPOINT" {
  type    = string
  default = "https://api.honeycomb.io"

}
variable "FRONTEND_URL" {
  type    = string
  default = "https://yacrud.me"

}
variable "BACKEND_URL" {
  type    = string
  default = "https://api.yacrud.me"

}
variable "service_cpu" {
  type    = string
  default = "256"

}
variable "service_memory" {
  type    = string
  default = "512"

}

variable "AWS_ACCOUNT_ID" {
  type = string
}