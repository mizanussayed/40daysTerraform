# Copy_Data_to_S3
The Nautilus DevOps team is presently immersed in data migrations, transferring data from on-premise storage systems to AWS S3 buckets. They have recently received some data that they intend to copy to one of the S3 buckets.

S3 bucket named devops-cp-25269 already exists. Copy the file /tmp/devops.txt to s3 bucket devops-cp-25269 using Terraform. 

## 🧑‍💻 main.tf code:
```hcl
resource "aws_s3_bucket" "my_bucket" {
  bucket = "devops-cp-25269"
  acl    = "private"

  tags = {
    Name        = "devops-cp-25269"
  }
}

# Copy the file to S3 bucket 
resource "aws_s3_object" "my_object" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "devops.txt"
  source = "/tmp/devops.txt"
  etag   = filemd5("/tmp/devops.txt")
}
```
