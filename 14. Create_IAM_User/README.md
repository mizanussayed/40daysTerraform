# Create_IAM_User

create an IAM user named iamuser_yousuf using terraform.

```hcl
resource "aws_iam_user" "iamuser_yousuf" {
  name = "iamuser_yousuf"
}
```

## by AWS CLI
```bash
aws iam create-user --user-name iamuser_yousuf
```
