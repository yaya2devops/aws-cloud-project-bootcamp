variable "BackendHealthy_threshold" {
  type    = number
  default = 2
}

variable "BackendUnhealthy_threshold" {
  type    = number
  default = 2
}

variable "BackendInterval" {
  type    = number
  default = 15
}

variable "BackendPath" {
  type    = string
  default = "/api/health-check"
}

variable "BackendTimeout" {
  type    = number
  default = 5
}

variable "FrontendPath" {
  type    = string
  default = "/"
}

variable "BackendPort" {
  type    = number
  default = 4567
}

variable "FrontendPort" {
  type    = number
  default = 3000
}

variable "FrontendHealthy_threshold" {
  type    = number
  default = 2
}

variable "FrontendUnhealthy_threshold" {
  type    = number
  default = 2
}

variable "FrontendInterval" {
  type    = number
  default = 15
}

variable "certificate_arn" {
  type      = string
  sensitive = true
}

variable "FrontendTimeout" {
  type    = number
  default = 5
}
