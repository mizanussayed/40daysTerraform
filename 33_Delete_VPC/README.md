# Delete_VPC
Delete a VPC named xfusion-vpc present in us-east-1 region using Terraform. Make sure to keep the provisioning code, as we might need to provision this instance again later.

## 🧑‍💻 previous main.tf code:
```hcl
resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "xfusion-vpc"
  }
}
```

## 🧑‍💻 commands to run:
```bash
terraform destroy -target=aws_vpc.this

# Verify the VPC is deleted
aws ec2 describe-vpcs --filters "Name=tag:Name,Values=xfusion-vpc"
```