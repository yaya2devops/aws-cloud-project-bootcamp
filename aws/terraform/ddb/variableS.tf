variable "deletion_protection_enabled" {
  type    = bool
  default = false
}

variable "memory_size" {
  type    = number
  default = 128

}

variable "PythonRuntime" {
  type    = string
  default = "python3.9"

}

variable "timeout" {
  type    = number
  default = 3

}
variable "AWS_ACCOUNT_ID" {
  type      = string
  sensitive = true
}
variable "REGION" {
  type      = string
  sensitive = true
}

variable "lambda_function_name" {

  type    = string
  default = "TFProcessDynamoDBStream"

}