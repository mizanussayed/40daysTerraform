# Delete_IAM_Role
Delete the IAM role named iamrole_kareem using Terraform. Make sure to keep the provisioning code, as we might need to provision this instance again later.

## 🧑‍💻 previous main.tf code:
```hcl
resource "aws_iam_role" "role" {
  name = "iamrole_kareem"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "iamrole_kareem"
  }
}
```

## 🧑‍💻 commands to run:
```bash
terraform destroy -target=aws_iam_role.role

# Verify the role is deleted
aws iam get-role --role-name iamrole_kareem
```