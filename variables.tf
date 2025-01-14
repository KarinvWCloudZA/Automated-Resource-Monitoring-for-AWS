variable "trail_name" {
  description = "The name of the CloudTrail"
  type        = string
  default     = "MainCloudTrail"  
}

variable "sns_emails" {
  description = "Comma-separated list of emails to subscribe to the SNS topics"
  type        = string
}
