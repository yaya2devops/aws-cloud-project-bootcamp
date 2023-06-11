data "aws_ssm_parameter" "AWS_ACCESS_KEY_ID" {
  name = "/cruddur/backend-flask/AWS_ACCESS_KEY_ID"
}

data "aws_ssm_parameter" "AWS_SECRET_ACCESS_KEY" {
  name = "/cruddur/backend-flask/AWS_SECRET_ACCESS_KEY"
}

data "aws_ssm_parameter" "CONNECTION_URL" {
  name = "/cruddur/backend-flask/CONNECTION_URL"
}

data "aws_ssm_parameter" "ROLLBAR_ACCESS_TOKEN" {
  name = "/cruddur/backend-flask/ROLLBAR_ACCESS_TOKEN"
}

data "aws_ssm_parameter" "OTEL_EXPORTER_OTLP_HEADERS" {
  name = "/cruddur/backend-flask/OTEL_EXPORTER_OTLP_HEADERS"
}

data "aws_ssm_parameter" "AWS_COGNITO_USER_POOL_CLIENT_ID" {
  name = "/cruddur/backend-flask/AWS_COGNITO_USER_POOL_CLIENT_ID"
}

data "aws_ssm_parameter" "AWS_COGNITO_USER_POOL_ID" {
  name = "/cruddur/backend-flask/AWS_COGNITO_USER_POOL_ID"
}