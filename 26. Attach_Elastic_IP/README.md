# Attach_Elastic_IP

The Nautilus DevOps team has been creating a couple of services on AWS cloud. They have been breaking down the migration into smaller tasks, allowing for better control, risk mitigation, and optimization of resources throughout the migration process. Recently they came up with requirements mentioned below.

There is an instance named nautilus-ec2 and an elastic-ip named nautilus-ec2-eip in us-east-1 region. Attach the nautilus-ec2-eip elastic-ip to the nautilus-ec2 instance using Terraform only. The Terraform working directory is /home/bob/terraform. Update the main.tf file (do not create a separate .tf file) to attach the specified Elastic IP to the instance.

## previous main.tf file content

```hcl
# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  subnet_id     = "subnet-5a0cdb688adadd47b"
  vpc_security_group_ids = [
    "sg-5504c3d070533ccd5"
  ]

  tags = {
    Name = "nautilus-ec2"
  }
}

# Provision Elastic IP
resource "aws_eip" "ec2_eip" {
  tags = {
    Name = "nautilus-ec2-eip"
  }
}
```

## Updated main.tf file content

```hcl
# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  subnet_id     = "subnet-5a0cdb688adadd47b"
  vpc_security_group_ids = [
    "sg-5504c3d070533ccd5"
  ]

  tags = {
    Name = "nautilus-ec2"
  }
}

# Provision Elastic IP
resource "aws_eip" "ec2_eip" {
  instance = aws_instance.ec2.id  # Attach the Elastic IP to the EC2 instance
  tags = {
    Name = "nautilus-ec2-eip"
  }
}
```

## verification by cli:
```bash
aws ec2 describe-addresses --region us-east-1 --filters "Name=tag:Name,Values=nautilus-ec2-eip"
```

