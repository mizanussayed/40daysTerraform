resource "aws_instance" "localstack_ec2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.localstack_key.key_name

  tags = {
    Name = "localstack-ec2-instance"
  }
}

output "ec2_instance_id" {
  value = aws_instance.localstack_ec2.id
}
