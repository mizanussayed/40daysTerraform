## Create_SNS_Topic

The Nautilus DevOps team needs to set up an SNS topic for sending notifications. 
They need to create an SNS topic with the following specifications:

- The topic name should be nautilus-notifications.

### Solution
To create an SNS topic named "nautilus-notifications", you can use the following Terraform code:

```hcl
resource "aws_sns_topic" "nautilus_notifications" {
  name = "nautilus-notifications"
}
```

## Verify To verify that the SNS topic has been created successfully, you can use the AWS CLI command:

```bash
aws sns list-topics
```
