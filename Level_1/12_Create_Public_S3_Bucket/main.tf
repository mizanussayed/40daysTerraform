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