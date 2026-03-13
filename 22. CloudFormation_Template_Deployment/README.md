# CloudFormation_Template_Deployment
The Nautilus DevOps team is working on automating infrastructure deployment using AWS CloudFormation. As part of this effort, they need to create a CloudFormation stack that provisions an S3 bucket with versioning enabled.

- Create a CloudFormation stack named devops-stack using Terraform.
- This stack should contain an S3 bucket named devops-bucket-26744 as a resource, 
- and the bucket must have versioning enabled. 

## inside the main.tf file, add the following code to create the CloudFormation stack:

```hcl
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
```

> **Note:** Use `aws_cloudformation_stack` (not `aws_s3_bucket`) to deploy resources through CloudFormation. The `template_body` defines the CloudFormation template inline using `jsonencode`.

## Alternative: Using inline YAML (heredoc) format

Instead of `jsonencode`, you can use a YAML heredoc string directly in `main.tf`:

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_cloudformation_stack" "devops_stack" {
  name = "devops-stack"

  template_body = <<YAML
AWSTemplateFormatVersion: "2010-09-09"
Resources:
  DevopsBucket:
    Type: AWS::S3::Bucket
    Properties:
      BucketName: devops-bucket-26744
      VersioningConfiguration:
        Status: Enabled
YAML
}
```

> Both approaches produce the same result. The YAML heredoc format is more readable for complex templates.

## To deploy the stack, follow these steps:
1. Initialize Terraform:

```bash
terraform init
```

2. Apply the configuration:

```bash
terraform apply
```