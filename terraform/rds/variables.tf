variable "backup_retention_period" {
  type    = number
  default = 0
}
variable "crd_db_tf" {
  type    = string
  default = "crd_db_tf"
}
variable "deletion_protection" {
  type    = bool
  default = false
}

variable "engine_version" {
  type    = string
  default = "15.2"
}
variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}
variable "password" {
  type      = string
  sensitive = true
}

variable "username" {
  type = string
}