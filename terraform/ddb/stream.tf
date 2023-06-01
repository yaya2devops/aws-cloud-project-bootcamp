# tflint-ignore: terraform_unused_declarations
data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "${path.module}/../../ddb/function/"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "TFProcessDynamoDBStream" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "lambda_function_payload.zip"
  function_name = var.lambda_function_name
  role          = aws_iam_role.process_lambda_role.arn
  handler       = "lambda_handler"
  memory_size   = var.memory_size
  package_type  = "Zip"
  runtime       = var.PythonRuntime
  timeout       = var.timeout
  environment {
    variables = {
      REGION = var.REGION
    }
  }

}

resource "aws_lambda_event_source_mapping" "lambda_event" {
  event_source_arn  = aws_dynamodb_table.ddb_tf.stream_arn
  function_name     = aws_lambda_function.ProcessDynamoDBStreamTF.arn
  starting_position = "LATEST"
  batch_size        = 1
}

resource "aws_cloudwatch_log_group" "processddbstream_log" {
  name = "/aws/lambda/${var.lambda_function_name}"

  retention_in_days = 14
}


resource "aws_cloudwatch_log_stream" "processddbstream_stream" {
  name           = "ProcessDDBStream"
  log_group_name = aws_cloudwatch_log_group.processddbstream_log.name
}

resource "aws_iam_role" "process_lambda_role" {
  name = "process_lambda_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      }
    ]
  })

  inline_policy {
    name = "LambdaExecutionPolicyTF"

    policy = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : "logs:CreateLogGroup",
          "Resource" : "arn:aws:logs:${var.REGION}:${var.AWS_ACCOUNT_ID}:*",
          "Effect" : "Allow"
        },
        {
          "Action" : [
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          "Resource" : "arn:aws:logs:${var.REGION}:${var.AWS_ACCOUNT_ID}:log-group:${var.lambda_function_name}:*"
          "Effect" : "Allow"
        },
        {
          "Action" : [
            "ec2:CreateNetworkInterface",
            "ec2:DeleteNetworkInterface",
            "ec2:DescribeNetworkInterfaces"
          ],
          "Resource" : "*",
          "Effect" : "Allow"
        },
        {
          "Action" : [
            "lambda:InvokeFunction"
          ],
          "Resource" : "*",
          "Effect" : "Allow"
        },
        {
          "Action" : [
            "dynamodb:DescribeStream",
            "dynamodb:GetRecords",
            "dynamodb:GetShardIterator",
            "dynamodb:ListStreams"
          ],
          "Resource" : "*",
          "Effect" : "Allow"
        }
      ]
    })
  }
}