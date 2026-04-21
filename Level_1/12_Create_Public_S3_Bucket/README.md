# Create_Public_S3_Bucket
Create a public S3 bucket named datacenter-s3-28068 using Terraform.

Ensure the bucket is accessible publicly once created by setting the proper ACL.

## Notes:

The name of the S3 bucket should be based on datacenter-s3-28068.
You can use the ACL settings to ensure the bucket is publicly accessible.

Here is the content for the `main.tf` file to create a public S3 bucket named `datacenter-s3-28068` in the `us-east-1` region using Terraform:

```hcl
resource "aws_s3_bucket" "public_bucket" {
  bucket = "datacenter-s3-28068"
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.public_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "public_acl" {
  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"

  depends_on = [
    aws_s3_bucket_public_access_block.public_access
  ]
}
```
This Terraform configuration will create an S3 bucket named `datacenter-s3-28068` and set its ACL to `public-read`, making it accessible to the public. Make sure to run `terraform init` and `terraform apply` in the terminal to create the resources.


