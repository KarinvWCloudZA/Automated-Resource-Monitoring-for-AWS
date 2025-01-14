resource "aws_cloudwatch_event_target" "ec2_target" {
  rule = aws_cloudwatch_event_rule.ec2_state_change.name
  arn  = aws_sns_topic.ec2_topic.arn
}

resource "aws_cloudwatch_event_target" "s3_target" {
  rule = aws_cloudwatch_event_rule.s3_monitoring.name
  arn  = aws_sns_topic.s3_topic.arn
}

resource "aws_cloudwatch_event_target" "iam_target" {
  rule = aws_cloudwatch_event_rule.iam_api_calls.name
  arn  = aws_sns_topic.iam_topic.arn
}

