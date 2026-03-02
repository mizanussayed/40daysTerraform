# Create_EBS_Volume
### task:

- create an AWS EBS volume using Terraform with the following requirements:
- Name of the volume should be nautilus-volume.
- Volume type must be gp3.
- Volume size must be 2 GiB.
- Ensure the volume is created in us-east-1.

### Solution:
To create an AWS EBS volume using Terraform with the specified requirements, you can use the following Terraform configuration:

```hcl
provider "aws" {
  region = "us-east-1"
}
```

```hcl
resource "aws_ebs_volume" "nautilus_volume" {
  availability_zone = "us-east-1a"
  size              = 2
  type              = "gp3"
  tags = {
    Name = "nautilus-volume"
  }
}
```

