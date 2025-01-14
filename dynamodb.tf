resource "aws_dynamodb_table" "events_table" {
  name         = "CloudTrailMetadata"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "file_name"

  attribute {
    name = "file_name"
    type = "S"
  }
}
