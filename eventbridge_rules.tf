resource "aws_cloudwatch_event_rule" "ec2_state_change" {
  name        = "EC2-Instance-Change"
  description = "Rule for EC2 instance state change notifications"
  event_pattern = jsonencode({
    "source"      : ["aws.ec2"],
    "detail-type" : ["EC2 Instance State-change Notification"]
  })
}

resource "aws_cloudwatch_event_rule" "s3_monitoring" {
  name        = "S3-Monitoring"
  description = "Rule for monitoring S3 via CloudTrail"
  event_pattern = jsonencode({
    "source"      : ["aws.s3"],
    "detail-type" : ["AWS API Call via CloudTrail"]
  })
}

resource "aws_cloudwatch_event_rule" "iam_api_calls" {
  name        = "IAM-Monitoring"
  description = "Rule for IAM API calls related to user creation and deletion"
  event_pattern = jsonencode({
    "source"      : ["aws.iam"],
    "detail-type" : ["AWS API Call via CloudTrail"],
    "detail"      : {
      "eventName" : ["CreateUser", "DeleteUser"]
    }
  })
}

