# Secrets_Manager_Setup

The Nautilus DevOps team needs to store sensitive data securely using AWS Secrets Manager. They need to create a secret with the following specifications:

1) The secret name should be datacenter-secret.

2) The secret value should contain a key-value pair with username: admin and password: Namin123.

3) Use Terraform to create the secret in AWS Secrets Manager.


provider "aws" {
  region = "us-east-1"
}

resource "aws_secretsmanager_secret" "datacenter_secret" {
  name = "datacenter-secret"
}

resource "aws_secretsmanager_secret_version" "datacenter_secret_value" {
  secret_id = aws_secretsmanager_secret.datacenter_secret.id

  secret_string = jsonencode({
    username = "admin"
    password = "Namin123"
  })
}
