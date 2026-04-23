# 3_replace_existing_ec2_instance

To test resilience and recreation behavior in Terraform, the DevOps team needs to demonstrate the use of the -replace option to forcefully recreate an EC2 instance without changing its configuration. Please complete the following tasks:

1. Use the Terraform CLI -replace option to destroy and recreate the EC2 instance devops-ec2, even though the configuration remains unchanged.

2. Ensure that the instance is recreated successfully.


Notes:

1. The new instance created using the -replace option should have a different instance ID than the previously provisioned instance.

2. The Terraform working directory is /home/bob/terraform.

Before submitting the task, ensure that terraform plan returns No changes. Your infrastructure matches the configuration.


```bash
terraform plan
terraform apply -replace=aws_instance.web_server
terraform plan
```