# Create_VPC
Create a VPC named xfusion-vpc in region us-east-1 with any IPv4 CIDR block through terraform.
The Terraform working directory is /home/bob/terraform. 

### inside main.tf file, add the following code:

```hcl
provider "aws" {
  region = "us-east-1"
}
```

```hcl
resource "aws_vpc" "xfusion_vpc" {
  cidr_block = "10.1.0.0/16"
    tags = {
        Name = "xfusion-vpc"
    }
}
```

### note 
here cidr means fullform classless inter-domain routing, which is a method for allocating IP addresses and routing Internet Protocol packets. The CIDR block "10.1.0.0/16" defines a network range that includes IP addresses from 10.1.0.0 to 10.1.255.255.
