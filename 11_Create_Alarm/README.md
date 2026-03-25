# Create_Alarm
### Task Details:
- Create a CloudWatch alarm named xfusion-alarm.
- The alarm should monitor CPU utilization of an EC2 instance.
- Trigger the alarm when CPU utilization exceeds 80%.
- Set the evaluation period to 5 minutes.
- Use a single evaluation period.


### Solution: main.tf file
```hcl
resource "aws_cloudwatch_metric_alarm" "xfusion_alarm" {
    alarm_name          = "xfusion-alarm"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    metric_name         = "CPUUtilization"
    namespace           = "AWS/EC2"
    period              = 300
    statistic           = "Average"
    threshold           = 80
}
```

### Commands
```bash
terraform init
terraform validate
terraform plan
terraform apply
```