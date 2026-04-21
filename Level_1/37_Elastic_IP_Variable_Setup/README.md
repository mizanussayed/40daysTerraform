# Elastic_IP_Variable_Setup
The Nautilus DevOps team is strategizing the migration of a portion of their infrastructure to the AWS cloud. As part of this phased migration approach, they need to allocate an Elastic IP address to support external access for specific workloads.

For this task, create an AWS Elastic IP using Terraform with the following requirement:

The Elastic IP name `devops-eip` should be stored in a variable named KKE_eip.

## variables.tf
```hcl
variable "KKE_eip" {
    description = "Name of the Elastic IP"
    type        = string
    default     = "devops-eip"
}
```
## main.tf
```hcl
resource "aws_eip" "devops_eip" {
  tags = {
    Name = var.KKE_eip
  }
}
```