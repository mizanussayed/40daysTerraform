# Terraform Practice for aws 40 days

This repository contains practice exercises for learning Terraform with AWS. Each exercise focuses on a specific AWS resource or service, allowing you to gain hands-on experience in creating and managing infrastructure using Terraform.

## install Terraform
Download the Terraform from the [official website](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


here i follow task fo (kodekloud)[https://kodekloud.com/practice/terraform-aws-40-days] and create this repository to share my code and practice with others.

```
hcl
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.91.0"
    }
  }
}
provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  s3_use_path_style = true

endpoints {
    ec2            = "http://aws:4566"
    apigateway     = "http://aws:4566"
    cloudformation = "http://aws:4566"
    cloudwatch     = "http://aws:4566"
    dynamodb       = "http://aws:4566"
    es             = "http://aws:4566"
    firehose       = "http://aws:4566"
    iam            = "http://aws:4566"
    kinesis        = "http://aws:4566"
    lambda         = "http://aws:4566"
    route53        = "http://aws:4566"
    redshift       = "http://aws:4566"
    s3             = "http://aws:4566"
    secretsmanager = "http://aws:4566"
    ses            = "http://aws:4566"
    sns            = "http://aws:4566"
    sqs            = "http://aws:4566"
    ssm            = "http://aws:4566"
    stepfunctions  = "http://aws:4566"
    sts            = "http://aws:4566"
    rds            = "http://aws:4566"
  }
}
```
