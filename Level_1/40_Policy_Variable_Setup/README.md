# Policy_Variable_Setup

The Nautilus DevOps team is automating IAM policy creation using Terraform to enhance security and access management. As part of this task, they need to create an IAM policy with specific requirements.

For this task, create an AWS IAM policy using Terraform with the following requirements:

The IAM policy name `iampolicy_yousuf` should be stored in a variable named `KKE_iampolicy`.

## variables.tf
```hcl
variable "KKE_iampolicy" {
  description = "The name of the IAM policy"
  type        = string
  default     = "iampolicy_yousuf"
}
```

## main.tf
```hcl
resource "aws_iam_policy" "policy" {
  name        = var.KKE_iampolicy
  description = "A policy for Yousuf's IAM role"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}
```

## verification
```bash
aws iam get-policy --policy-name iampolicy_yousuf
```