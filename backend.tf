terraform {
  backend "s3" {
    bucket         = "YOUR_BUCKET_NAME"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "YOUR_TABLE_NAME"
  }
}