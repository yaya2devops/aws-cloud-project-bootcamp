variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr_blocks" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.4.0/24", "10.0.8.0/24"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["ca-central-1a", "ca-central-1b", "ca-central-1c"]
}

variable "stack_name" {
  type    = string
  default = "YacrudSr-TF"
}
