# Create_Private_S3_Bucket
Create an S3 bucket using Terraform with the following details:
1) The name of the S3 bucket must be devops-s3-20645.
2) The S3 bucket must block all public access, making it a private bucket.

```hcl
resource "aws_s3_bucket" "private_bucket" {
  bucket = "devops-s3-20645"
  acl    = "private"  # Ensures the bucket is private
}

resource "aws_s3_bucket_public_access_block" "private_access_block" {
  bucket = aws_s3_bucket.private_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
```
or like below:

```hcl
resource "aws_s3_bucket" "devops_s3" {
  bucket = "devops-s3-20645"
  acl    = "private"  # Set the ACL to private to block public access

  # Block public access settings
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true

  tags = {
    Name        = "devops-s3-20645"
    Environment = "Development"
  }
}
```
