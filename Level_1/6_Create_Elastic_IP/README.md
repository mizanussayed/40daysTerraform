# Create_Elastic_IP
### task:
allocate an Elastic IP address named datacenter-eip using Terraform.

### solution:
```hcl
provider "aws" {
    region = "us-east-1"
}
```

```hcl
resource "aws_eip" "datacenter_eip" {
    domain = "vpc"
    tags = {
        Name = "datacenter-eip"
    }
}
```
### verify
To verify that the Elastic IP address has been created, you can run the following command in your terminal:

```bash 
aws ec2 describe-addresses --filters "Name=tag:Name,Values=datacenter-eip"
```