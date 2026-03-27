The Nautilus DevOps team needs to store sensitive data securely using AWS Secrets Manager. They need to create a secret with the following specifications:

1) The secret name should be xfusion-secret-t3q3.

2) The secret value should contain a key-value pair with username: admin and password: Namin123.

3) Use Terraform to create the secret in AWS Secrets Manager.

The Terraform working directory is /home/bob/terraform/t3q3. Create the main.tf file (do not create a different .tf file) to accomplish this task.


provider "aws" {
  region = "us-east-1"
}

# Create the secret container
resource "aws_secretsmanager_secret" "xfusion_secret" {
  name = "xfusion-secret-t3q3"
}

# Store the secret value (JSON format)
resource "aws_secretsmanager_secret_version" "xfusion_secret_value" {
  secret_id = aws_secretsmanager_secret.xfusion_secret.id

  secret_string = jsonencode({
    username = "admin"
    password = "Namin123"
  })
}