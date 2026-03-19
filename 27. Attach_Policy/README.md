# Attach_Policy
- An IAM user named iamuser_mark and 
- a policy named iampolicy_mark already exists. 
- Use Terraform to attach the IAM policy iampolicy_mark to the IAM user iamuser_mark.

```hcl
# Create IAM user
resource "aws_iam_user" "user" {
  name = "iamuser_mark"

  tags = {
    Name = "iamuser_mark"
  }
}

# Create IAM Policy
resource "aws_iam_policy" "policy" {
  name        = "iampolicy_mark"
  description = "IAM policy allowing EC2 read actions for mark"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ec2:Read*"]
        Resource = "*"
      }
    ]
  })
}
```

# updated portion of the code to attach the policy to the user

```hcl
# Attach the policy to the user
resource "aws_iam_user_policy_attachment" "attachment" {
    user       = aws_iam_user.user.name
    policy_arn = aws_iam_policy.policy.arn
}
```
