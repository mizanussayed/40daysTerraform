# Create_VPC_with_IPv6
create a VPC named devops-vpc in the us-east-1 region with the Amazon-provided IPv6 CIDR block using terraform

in the main.tf file, add the following code:

```hcl
provider "aws" {
  region = "us-east-1"
}
```

```hcl
resource "aws_vpc" "devops_vpc" {
  cidr_block = "10.0.0.0/16"
    assign_generated_ipv6_cidr_block = true
    tags = {
    Name = "devops-vpc"
    }
}
```

## verify the VPC is created with IPv6 CIDR block
run the following command in the terminal:
```bash
terraform init
terraform apply
```
After the apply command is successful, you can verify the VPC is created with IPv6 CIDR block by running the following command:
```bash 
aws ec2 describe-vpcs --region us-east-1 --filters Name=tag:Name,Values=devops-vpc
```
