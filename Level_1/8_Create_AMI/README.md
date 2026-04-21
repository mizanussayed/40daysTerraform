# Create_AMI

### task:
1. create an AMI from an existing EC2 instance named xfusion-ec2 using Terraform.
2. Name of the AMI should be xfusion-ec2-ami, make sure AMI is in available state.
3. The Terraform working directory is /home/bob/terraform. Update the main.tf file (do not create a separate .tf file) to create the AMI.

## previous code in main.tf
```hcl
# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-386d4df82b8dfb3fd"
  ]

  tags = {
    Name = "xfusion-ec2"
  }
}
```

## updated code in main.tf
```hcl
# append the following code to main.tf
# Create AMI from EC2 instance
resource "aws_ami_from_instance" "xfusion_ami" {
  name                    = "xfusion-ec2-ami"
  source_instance_id      = aws_instance.ec2.id
  snapshot_without_reboot = false
}
```
