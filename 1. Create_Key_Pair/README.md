# Create_Key_Pair using terraform

This tutorial will show you how to create a key pair using terraform. A key pair is used to securely connect to your EC2 instances.

## Prerequisites
- Terraform installed on your local machine
- An AWS account
- AWS CLI configured with your credentials
## Steps to Create Key Pair

1. Create a new file named `main.tf` and add the following code to create a key pair:
```bash
hclprovider "aws" {
  region = "us-west-2"
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair"
  public_key = file("~/.ssh/id_rsa.pub")
}
```
3. Initialize the terraform project:
```bash
terraform init
```
4. Apply the terraform configuration to create the key pair:
```bash
terraform apply
```
5. Review the changes and type `yes` to confirm the creation of the key pair.





