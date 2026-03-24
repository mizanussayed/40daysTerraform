# Delete_Backup_from_S3

The Nautilus DevOps team is currently engaged in a cleanup process, focusing on removing unnecessary data and services from their AWS account. As part of the migration process, several resources were created for one-time use only, necessitating a cleanup effort to optimize their AWS environment.

A S3 bucket named xfusion-bck-29289 already exists.

1) Copy the contents of xfusion-bck-29289 S3 bucket to /opt/s3-backup/ directory on terraform-client host (the landing host once you load this lab).

2) Delete the S3 bucket xfusion-bck-29289.

3) Use the AWS CLI through Terraform to accomplish this task—for example, by running AWS CLI commands within Terraform.

## Step 1: Copy S3 bucket contents to local directory
To copy the contents of the S3 bucket `xfusion-bck-29289` to the local directory `/opt/s3-backup/`, you can use the AWS CLI command `aws s3 cp` with the `--recursive` option. Here’s how you can do it:

```bash
aws s3 cp s3://xfusion-bck-29289/ /opt/s3-backup/ --recursive
```

## Step 2: Delete the S3 bucket
To delete the S3 bucket `xfusion-bck-29289`, you can use the
AWS CLI command `aws s3 rb` with the `--force` option to remove the bucket and all of its contents:

```bash 
aws s3 rb s3://xfusion-bck-29289 --force
```
## Step 3: Use AWS CLI through Terraform
To execute AWS CLI commands through Terraform, you can use the `null_resource` and `local-exec` provisioner. Here’s an example of how to set this up in your `main.tf` file:

```hcl
resource "null_resource" "copy_and_delete_s3_bucket" {
  provisioner "local-exec" {
    command = <<EOT
      aws s3 cp s3://xfusion-bck-29289/ /opt/s3-backup/ --recursive
      aws s3 rb s3://xfusion-bck-29289 --force
    EOT
  }
}
```

