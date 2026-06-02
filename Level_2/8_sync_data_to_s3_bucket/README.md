# 8_sync_data_to_s3_bucket
 
## 🎯 task
1. Create a New Private S3 Bucket: Name the bucket datacenter-sync-13539 and store this bucket name in a variable named KKE_BUCKET.

2. Data Migration: Migrate all data from the existing datacenter-s3-21956 bucket to the new datacenter-sync-13539 bucket.

3. Ensure Data Consistency: Ensure that both buckets contain the same data after migration.

4. Update the main.tf file (do not create a separate .tf file) to provision a new private S3 bucket and migrate the data.

5. Use the variables.tf file with the following variable:
    `KKE_BUCKET`: The name for the new bucket created.

6. Use the outputs.tf file with the following outputs:

    * `new_kke_bucket_name`: The name of the new bucket created.

    * `new_kke_bucket_acl`: The ACL of the new bucket created.

## 🧑‍💻 Solution

## previous main.tf 
```hcl
resource "aws_s3_bucket" "wordpress_bucket" {
  bucket = "datacenter-s3-21956"
}

resource "aws_s3_bucket_acl" "wordpress_bucket_acl" {
  bucket = aws_s3_bucket.wordpress_bucket.id
  acl    = "private"
}

```

## update main.tf
```hcl

```

## variables.tf
```hcl
variable "KKE_BUCKET" {
  description = "The name for the new bucket created"
  type        = string
  default     = "datacenter-sync-13539"
}
```
## outputs.tf
```hcl
output "new_kke_bucket_name" {
  description = "The name of the new bucket created"
  value       = aws_s3_bucket.sync_bucket.id
}

output "new_kke_bucket_acl" {
  description = "The ACL of the new bucket created"
  value       = aws_s3_bucket_acl.sync_bucket_acl.acl
}

```