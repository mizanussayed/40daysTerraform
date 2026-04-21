# Security_Group_Variable_Setup
The Nautilus DevOps team is enhancing infrastructure automation and needs to provision a Security Group using Terraform with specific configurations.

For this task, create an AWS Security Group using Terraform with the following requirements:

The Security Group name `nautilus-sg` should be stored in a variable named KKE_sg.
Note:

1. The configuration values should be stored in a variables.tf file.

2. The Terraform script should be structured with a main.tf file referencing variables.tf.

## variables.tf

```hcl
variable "KKE_sg" {
  description = "Name of the Security Group"
  type        = string
  default     = "nautilus-sg"
}
```

## main.tf
```hcl
resource "aws_security_group" "nautilus_sg" {
  name        = var.KKE_sg
  description = "Security group for Nautilus project"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```
