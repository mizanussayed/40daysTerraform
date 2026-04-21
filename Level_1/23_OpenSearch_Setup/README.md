# OpenSearch_Setup
The Nautilus DevOps team needs to set up an Amazon OpenSearch Service domain to store and search their application logs. The domain should have the following specification:

1) The domain name should be devops-es.

2) Use Terraform to create the OpenSearch domain. The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.

Notes:
- Before submitting the task, ensure that terraform plan returns No changes. Your infrastructure matches the configuration.

- The OpenSearch domain creation process may take several minutes. Please wait until the domain is fully created before submitting.

Here is an example of how the main.tf file could look to create an Amazon OpenSearch Service domain named devops-es using Terraform:

```hcl
provider "aws" {
  region = "us-west-2" # Specify your desired AWS region
}

resource "aws_opensearch_domain" "devops_es" {
  domain_name = "devops-es"
  engine_version = "OpenSearch_1.0"

  cluster_config {
    instance_type = "t3.medium.elasticsearch"
    instance_count = 1
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }
}
```
Make sure to replace the region and instance type with your desired values. After creating the main.tf file, run `terraform init` to initialize the Terraform working directory, and then run `terraform apply` to create the OpenSearch domain. Once the domain is created, you can run `terraform plan` to verify that there are no changes needed.

