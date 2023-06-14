resource "aws_dynamodb_table" "ddb_tf" {
  name                        = "crd-dynamo-tf"
  billing_mode                = "PROVISIONED"
  read_capacity               = 5
  write_capacity              = 5
  table_class                 = "STANDARD"
  hash_key                    = "pk"
  range_key                   = "sk"
  deletion_protection_enabled = var.deletion_protection_enabled
  stream_enabled              = true
  stream_view_type            = "NEW_IMAGE"

  attribute {
    name = "message_group_uuid"
    type = "S"
  }

  attribute {
    name = "pk"
    type = "S"
  }

  attribute {
    name = "sk"
    type = "N"
  }


  global_secondary_index {
    name            = "message-group-sk-index"
    hash_key        = "message_group_uuid"
    range_key       = "sk"
    write_capacity  = 5
    read_capacity   = 5
    projection_type = "ALL"
  }

  tags = {
    Name        = "crd-dynamo-tf"
    Environment = "dev"
  }
}