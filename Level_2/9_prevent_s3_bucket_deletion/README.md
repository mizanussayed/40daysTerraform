# 9_prevent_s3_bucket_deletion

# Day 88: Ansible Blockinfile Module

## 🎯 task
1. Create an S3 bucket named devops-s3-3741.

2. Apply the prevent_destroy lifecycle rule to protect the bucket.

3. Create the main.tf file (do not create a separate .tf file) to provision a s3 bucket with prevent_destroy lifecycle rule.

4. Use the variables.tf file with the following:

* `KKE_BUCKET_NAME`: name of the bucket.

5. Use the terraform.tfvars file to input the name of the bucket.

6. Use the outputs.tffile with the following:

* `s3_bucket_name`: name of the created bucket.


## 🧑‍💻 Solution

## main.tf
```hcl
resource "aws_s3_bucket" "devops_bucket" {
  bucket = var.KKE_BUCKET_NAME

  # বাকেটটি যাতে ভুলবশত ডিলিট না হয় তার জন্য লাইফসাইকেল রুল
  lifecycle {
    prevent_destroy = true
  }
}
```

## variables.tf
```hcl
variable "KKE_BUCKET_NAME" {
  description = "The name of the S3 bucket"
  type        = string
}
```

## outputs.tf
```hcl
output "s3_bucket_name" {
  description = "The name of the created bucket"
  value       = aws_s3_bucket.devops_bucket.id
}
```

## terraform.tfvars
```hcl
KKE_BUCKET_NAME = "devops-s3-3741"
```