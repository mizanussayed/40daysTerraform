# User_Variable_Setup
 create an AWS IAM User using Terraform with the following requirements:

The IAM User name iamuser_jim should be stored in a variable named KKE_user.

## variables.tf
```hcl
variable "KKE_user" {
  description = "The name of the IAM user"
  type        = string
  default     = "iamuser_jim"
}
```
## main.tf
```hcl
resource "aws_iam_user" "user" {
  name = var.KKE_user
}
```

## outputs.tf
```hcl
output "iam_user_name" {
  value = aws_iam_user.user.name
}
```