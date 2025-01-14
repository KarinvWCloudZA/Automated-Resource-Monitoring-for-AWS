# Automated-Resource-Monitoring-for-AWS
A collection of Terraform scripts to monitor EC2 instances, log CloudTrail events to S3, track S3 bucket changes, store log metadata in DynamoDB, monitor IAM role actions, and send SNS notifications for all monitored activities, enhancing AWS resource visibility, security, and operational insights.

# AWS Monitoring with Terraform

This repository contains Terraform scripts to set up monitoring and notifications for AWS resources. It includes configurations for logging, notifications, and metadata storage, ensuring comprehensive resource visibility and security.

## Prerequisites

Before using this repository, ensure you have the following:

- [Terraform](https://www.terraform.io/downloads.html) installed on your system.
- The AWS CLI installed and configured:
  aws configure
  
- An S3 bucket created (via CLI or AWS Management Console) to store the Terraform state file.
- A DynamoDB table created (via CLI or AWS Management Console) to manage the `.lock` file for state management.

## Setup

1. **Backend Configuration**:
   - Add the names of your manually created S3 bucket and DynamoDB table to the `backend.tf` file.

2. **Clone the Repository**:
   git clone <repository-url>
   cd <repository-name>
   
3. **Initialize Terraform**:
   terraform init
   

4. **Apply Terraform Configuration**:
   - Review and update the `variables.tf` file as needed.
   - Run the following command to deploy resources:
     terraform apply
     
## Resources Created by the Terraform Scripts

- **CloudTrail**:
  - Logs management events to an S3 bucket.
- **DynamoDB Table**:
  - Stores metadata extracted from S3 bucket logs.
- **EventBridge Rules**:
  - Monitors:
    - EC2 instance state changes.
    - Changes in the S3 bucket (e.g., object creation/deletion).
    - IAM role actions (e.g., user creation/deletion).
- **SNS Topics**:
  - Targets for EventBridge rules.
  - Each rule has a dedicated SNS topic.
  - Supports input of email addresses (via parameter) for topic subscription.
  - Recipients must confirm their subscription.
- **Lambda Function**:
  - Extracts metadata from S3 logs and adds it to the DynamoDB table.

## Configuration Details

- **S3 Bucket**: Stores CloudTrail logs and Terraform state files.
- **DynamoDB Table**: Manages Terraform state file locking and stores log metadata.
- **Backend Configuration**: Ensure your manually created S3 bucket and DynamoDB table names are correctly set in `backend.tf`.

## How It Works

1. **Logging**:
   - CloudTrail logs management events to an S3 bucket.
2. **Monitoring**:
   - EventBridge rules capture changes in EC2 instance states, S3 bucket activity, and IAM role actions.
3. **Notifications**:
   - SNS topics notify subscribed email addresses of the monitored events.
4. **Metadata Storage**:
   - A Lambda function processes S3 logs and stores metadata in a DynamoDB table.
