# 5_associate_elastic_ip_with_ec2_instance
1. Create an EC2 instance named xfusion-ec2 using any Linux AMI like Ubuntu.

2. Instance type must be t2.micro and associate an Elastic IP address named xfusion-eip with this instance.

3. Use the main.tf file (do not create a separate .tf file) to provision the EC2-Instance and Elastic IP.

4. Use the outputs.tf file and output the instance name using variable KKE_instance_name and the Elastic IP using variable KKE_eip.

## Solution

### outputs.tf
```hcl
output "KKE_instance_name" {
  value = aws_instance.xfusion-ec2.tags["Name"]
}
output "KKE_eip" {
  value = aws_eip.xfusion-eip.public_ip
}
```
### main.tf
```hcl
resource "aws_instance" "xfusion-ec2" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"

  tags = {
    Name = "xfusion-ec2"
  }
}
resource "aws_eip" "xfusion-eip" {
  instance = aws_instance.xfusion-ec2.id
  tags = {
    Name = "xfusion-eip"
  }
}
```
