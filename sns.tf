resource "aws_sns_topic" "ec2_topic" {
  name = "EC2-Instance-Change-Topic"
}

resource "aws_sns_topic" "s3_topic" {
  name = "S3-Monitoring-Topic"
}

resource "aws_sns_topic" "iam_topic" {
  name = "IAM-Monitoring-Topic"
}

locals {
  email_subscriptions = flatten([
    for topic in [
      aws_sns_topic.ec2_topic,
      aws_sns_topic.s3_topic,
      aws_sns_topic.iam_topic
    ] :
    [
      for email in split(",", var.sns_emails) :
      {
        topic_arn = topic.arn
        email     = email
      }
    ]
  ])
}

resource "aws_sns_topic_subscription" "email_subscriptions" {
  for_each = { for idx, sub in local.email_subscriptions : idx => sub }

  topic_arn = each.value.topic_arn
  protocol  = "email"
  endpoint  = each.value.email
}
