# Create_DynamoDB_Table
1) The table name should be xfusion-users.

2) The primary key should be xfusion_id (String).

3) The table should use PAY_PER_REQUEST billing mode.

Use Terraform to create this DynamoDB table. 

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "xfusion_users" {
  name         = "xfusion-users"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "xfusion_id"

  attribute {
    name = "xfusion_id"
    type = "S"
  }
}
```