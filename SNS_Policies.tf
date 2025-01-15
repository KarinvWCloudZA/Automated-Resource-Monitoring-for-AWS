resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.ec2_topic.arn
  policy = data.aws_iam_policy_document.ec2_sns_topic_policy.json
}

resource "aws_sns_topic_policy" "s3_policy" {
  arn    = aws_sns_topic.s3_topic.arn
  policy = data.aws_iam_policy_document.s3_sns_topic_policy.json
}

resource "aws_sns_topic_policy" "iam_policy" {
  arn    = aws_sns_topic.iam_topic.arn
  policy = data.aws_iam_policy_document.iam_sns_topic_policy.json
}

data "aws_iam_policy_document" "ec2_sns_topic_policy" {
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]
    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
    resources = [aws_sns_topic.ec2_topic.arn]
  }
}

data "aws_iam_policy_document" "s3_sns_topic_policy" {
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]
    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
    resources = [aws_sns_topic.s3_topic.arn]
  }
}

data "aws_iam_policy_document" "iam_sns_topic_policy" {
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]
    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
    resources = [aws_sns_topic.iam_topic.arn]
  }
}