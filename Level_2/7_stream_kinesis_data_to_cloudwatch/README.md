# 7_stream_kinesis_data_to_cloudwatch

## 🎯 task
1. Create a Kinesis Data Stream: Name the stream `datacenter-kinesis-stream` with a shard count of 1.

2. Enable Monitoring: Enable shard-level metrics for the stream to track ingestion and throughput errors.

3. Create a CloudWatch Alarm: Name the alarm `datacenter-kinesis-alarm` and monitor the WriteProvisionedThroughputExceeded metric. The alarm should trigger if the metric exceeds a threshold of 1.

4. Ensure Alerting: Configure the CloudWatch alarm to detect write throughput issues exceeding provisioned limits.

5. Create the main.tf file (do not create a separate .tf file) to provision the Kinesis stream, CloudWatch alarm, and ensure alerting.

6. Create the outputs.tf file with the following variable names to output:

    - kke_kinesis_stream_name for the Kinesis stream name.

    - kke_kinesis_alarm_name for the CloudWatch alarm name.


## 🧑‍💻 Solution
# main.tf
```hcl
provider "aws" {
  region = "us-east-1"
}

# Kinesis Data Stream
resource "aws_kinesis_stream" "datacenter_stream" {
  name             = "datacenter-kinesis-stream"
  shard_count      = 1
  retention_period = 24

  shard_level_metrics = [
    "IncomingBytes",
    "IncomingRecords",
    "WriteProvisionedThroughputExceeded",
    "ReadProvisionedThroughputExceeded",
    "OutgoingBytes",
    "OutgoingRecords",
    "IteratorAgeMilliseconds"
  ]
}

# CloudWatch Alarm for Write Throughput Exceeded
resource "aws_cloudwatch_metric_alarm" "kinesis_alarm" {
  alarm_name          = "datacenter-kinesis-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "WriteProvisionedThroughputExceeded"
  namespace           = "AWS/Kinesis"
  period              = 60
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alarm when write throughput exceeds provisioned limits"
  treat_missing_data  = "notBreaching"

  dimensions = {
    StreamName = aws_kinesis_stream.datacenter_stream.name
  }

  # Placeholder for alerting action (e.g., SNS topic)
  # alarm_actions = [aws_sns_topic.alerts.arn]
}
```

# outputs.tf
```hcl
output "kke_kinesis_stream_name" {
  value = aws_kinesis_stream.datacenter_stream.name
}

output "kke_kinesis_alarm_name" {
  value = aws_cloudwatch_metric_alarm.kinesis_alarm.alarm_name
}
```