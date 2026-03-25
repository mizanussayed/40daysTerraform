# Create_Kinesis_Stream
The Nautilus DevOps team needs to create an AWS Kinesis data stream for real-time data processing.
-  This stream will be used to ingest and process large volumes of streaming data, 
- which will then be consumed by various applications for analytics and real-time decision-making. 
- The stream should be named `devops-stream`. 

##  Steps to create the Kinesis stream using Terraform:

`terraform plan` --to check is any previous pending status 

## inside `main.tf` file

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_kinesis_stream" "devops_stream" {
  name        = "devops-stream"
  shard_count = 1
}
```

## to create the stream, run the following commands in your terminal:
```bash
terraform init
terraform apply -auto-approve

# verify the stream is created
aws kinesis describe-stream-summary --stream-name devops-stream
```