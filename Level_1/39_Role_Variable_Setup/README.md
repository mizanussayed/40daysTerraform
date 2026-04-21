# Role_Variable_Setup
The Nautilus DevOps team is automating IAM role creation using Terraform to streamline permissions management. As part of this task, they need to create an IAM role with specific requirements.

For this task, create an AWS IAM role using Terraform with the following requirements:

The IAM role name ``iamrole_kareem` should be stored in a variable named `KKE_iamrole`.

## variables.tf
```hcl
variable "KKE_iamrole" {
  description = "The name of the IAM role"
  type        = string
  default     = "iamrole_kareem"
}
```

## main.tf
```hcl
resource "aws_iam_role" "role" {
  name = var.KKE_iamrole

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
```

## verification
```bash
aws iam get-role --role-name iamrole_kareem
```