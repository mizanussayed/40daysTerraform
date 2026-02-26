# Create_VPC_with_CIDR
#### task:
Create a VPC named xfusion-vpc in us-east-1 region with 192.168.0.0/24 IPv4 CIDR using terraform.

### inside main.tf file, add the following code:

```hcl
provider "aws" {
    region = "us-east-1"
}
```
```hcl
resource "aws_vpc" "xfusion_vpc" {
    cidr_block = "192.168.0.0/24"
    tags = {
        Name = "xfusion-vpc"
    }
}
```
