provider "aws" {
  region = "us-east-1"
}

resource "aws_cloudformation_stack" "devops_stack" {
  name = "devops-stack"

  template_body = jsonencode({
    AWSTemplateFormatVersion = "2010-09-09"
    Resources = {
      DevopsBucket = {
        Type = "AWS::S3::Bucket"
        Properties = {
          BucketName = "devops-bucket-26744"
          VersioningConfiguration = {
            Status = "Enabled"
          }
        }
      }
    }
  })
}
