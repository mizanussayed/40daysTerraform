# Create_Security_Group
### taks: 
Use Terraform to create a security group under the default VPC with the following requirements:

1) The name of the security group must be nautilus-sg.
2) The description must be Security group for Nautilus App Servers.
3) Add an inbound rule of type HTTP, with a port range of 80, and source CIDR range 0.0.0.0/0.
4) Add another inbound rule of type SSH, with a port range of 22, and source CIDR range 0.0.0.0/0.

Ensure that the security group is created in the us-east-1 region using Terraform. The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.


### Solution:
```hcl
provider "aws" {
  region = "us-east-1"
}
```

```hcl
resource "aws_security_group" "nautilus_sg" {
    name        = "nautilus-sg"
    description = "Security group for Nautilus App Servers"
    vpc_id      = data.aws_vpc.default.id
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
```

```hcl
data "aws_vpc" "default" {
  default = true
}
```