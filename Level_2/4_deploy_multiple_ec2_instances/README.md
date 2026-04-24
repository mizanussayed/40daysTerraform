# 4_deploy_multiple_ec2_instances

1. Create 3 EC2 instances using the count parameter.

2. Name each EC2 instance with the prefix xfusion-instance (e.g., xfusion-instance-1).

3. Instances should be t2.micro.

4. The key named should be xfusion-key.

5. Use variables.tf file with the following:

    - KKE_INSTANCE_COUNT: number of instances.
    - KKE_INSTANCE_TYPE: type of the instance.
    - KKE_KEY_NAME: name of key used.
    - KKE_INSTANCE_PREFIX: name of the instance.

6. Use the locals.tf file to define a local variable named AMI_ID that retrieves the latest Amazon Linux 2 AMI using a data source.

7. Use terraform.tfvars to assign values to the variables.

8. Use outputs.tf file to output the following:

    - kke_instance_names: names of the instances created.

## variables.tf

```hcl
variable "KKE_INSTANCE_COUNT" {
  description = "Number of EC2 instances to create"
  type        = number
}
variable "KKE_INSTANCE_TYPE" {
  description = "Type of EC2 instance to create"
  type        = string
}
variable "KKE_KEY_NAME" {
  description = "Name of the key pair to use"
  type        = string
}
variable "KKE_INSTANCE_PREFIX" {
  description = "Prefix for the EC2 instance names"
  type        = string
}
```
## locals.tf

```hcl
locals {
  AMI_ID = data.aws_ami.latest_amazon_linux.id
}
```

## outputs.tf

```hcl
output "kke_instance_names" {
  description = "Names of the EC2 instances created"
  value       = [for i in aws_instance.kke_instances : i.tags["Name"]]
}
```

## terraform.tfvars

```hcl
KKE_INSTANCE_COUNT  = 3
KKE_INSTANCE_TYPE   = "t2.micro"
KKE_KEY_NAME       = "xfusion-key"
KKE_INSTANCE_PREFIX = "xfusion-instance"
```

## main.tf

```hcl
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}

resource "aws_instance" "kke_instances" {
  count         = var.KKE_INSTANCE_COUNT
  ami           = local.AMI_ID
  instance_type = var.KKE_INSTANCE_TYPE
  key_name      = var.KKE_KEY_NAME

  tags = {
    Name = "${var.KKE_INSTANCE_PREFIX}-${count.index + 1}"
  }
}
```