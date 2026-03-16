# Change_Instance_Type

### task: Change the instance type of an EC2 instance using Terraform
- Change the instance type from t2.micro to t2.nano for xfusion-ec2 instance using terraform.
- Make sure the EC2 instance xfusion-ec2 is in running state after the change.

```bash
aws ec2 describe-instances --filters "Name=tag:Name,Values=xfusion-ec2" --query "Reservations[*].Instances[*].State.Name"
```