# Enable_S3_Versioning

The S3 bucket name is devops-s3-4771, enable versioning for this bucket using Terraform.

## current main.tf file

```hcl
resource "aws_s3_bucket" "s3_ran_bucket" {
  bucket = "devops-s3-4771"
  acl    = "private"

  tags = {
    Name        = "devops-s3-4771"
  }
}
```
## Updated main.tf file

```hcl
resource "aws_s3_bucket" "s3_ran_bucket" {
  bucket = "devops-s3-4771"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "devops-s3-4771"
  }
}
```
