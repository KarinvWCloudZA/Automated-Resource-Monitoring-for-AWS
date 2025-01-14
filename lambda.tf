resource "aws_lambda_function" "process_s3_events" {
  function_name    = "ProcessS3Events"
  runtime          = "python3.12"
  handler          = "lambda_function.lambda_handler"
  role             = aws_iam_role.lambda_exec.arn
  filename         = "lambda.zip" 
  environment {
    variables = {
      DYNAMODB_TABLE = aws_dynamodb_table.events_table.name
    }
  }
}