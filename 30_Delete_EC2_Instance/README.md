# Delete_EC2_Instance
During the migration process, several resources were created under the AWS account. Some of these test resources are no longer needed at the moment, so we need to clean them up temporarily. One such instance is currently unused and should be deleted.

1) Delete the ec2 instance named devops-ec2 present in us-east-1 region using terraform. Make sure to keep the provisioning code, as we might need to provision this instance again later.

2) Before submitting your task, make sure instance is in terminated state.

## previous main.tf file
```hcl
# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-f7d885585d7d9a82e"
  ]

  tags = {
    Name = "devops-ec2"
  }
}
``` 
## Verify the instance is deleted
```bash
terraform destroy -target=aws_instance.ec2


aws ec2 describe-instances \
  --region us-east-1 \
  --filters "Name=tag:Name,Values=devops-ec2" \
  --query "Reservations[].Instances[].State.Name"
```


