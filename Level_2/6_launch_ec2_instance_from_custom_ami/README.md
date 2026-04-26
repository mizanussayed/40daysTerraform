# 6_launch_ec2_instance_from_custom_ami
1. They have an existing EC2 instance named xfusion-ec2.

2. They need to create an AMI named xfusion-ec2-ami from this instance.

3. Additionally, they need to launch a new EC2 instance named xfusion-ec2-new using this AMI.

4. Create an outputs.tf file to output the following values:

    - KKE_ami_id for the AMI ID you created.
    - KKE_new_instance_id for the EC2 instance ID you created.


## previous main.tf file
```hcl
# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-fc883b6ffe6720baf"
  ]

  tags = {
    Name = "xfusion-ec2"
  }
}
```
## main.tf file after modification
```hcl
# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-fc883b6ffe6720baf"
  ]
  tags = {
    Name = "xfusion-ec2"
  }
}

# Create AMI from existing EC2 instance
resource "aws_ami" "xfusion_ami" {
  name               = "xfusion-ec2-ami"
  depends_on         = [aws_instance.ec2]
}

# Launch new EC2 instance from the created AMI
resource "aws_instance" "xfusion_ec2_new" {
    ami           = aws_ami.xfusion_ami.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [
        "sg-fc883b6ffe6720baf"
    ]
    tags = {
        Name = "xfusion-ec2-new"
    }
    depends_on = [aws_ami.xfusion_ami]
}
```
## outputs.tf file
```hcl
output "KKE_ami_id" {
  value = aws_ami.xfusion_ami.id
}
output "KKE_new_instance_id" {
  value = aws_instance.xfusion_ec2_new.id
}
``` 