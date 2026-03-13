# CloudWatch_Setup
## The Nautilus DevOps team needs to set up CloudWatch logging for their application. They need to create a CloudWatch log group and log stream with the following specifications:

1) The log group name should be devops-log-group.

2) The log stream name should be devops-log-stream.

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_cloudwatch_log_group" "devops_log_group" {
  name = "devops-log-group"
}

resource "aws_cloudwatch_log_stream" "devops_log_stream" {
  name           = "devops-log-stream"
  log_group_name = aws_cloudwatch_log_group.devops_log_group.name
}
```

## verify:
```bash
aws logs create-log-group --log-group-name devops-log-group
aws logs describe-log-groups

aws logs create-log-stream \
  --log-group-name devops-log-group \
  --log-stream-name devops-log-stream

aws logs describe-log-streams --log-group-name devops-log-group
```
