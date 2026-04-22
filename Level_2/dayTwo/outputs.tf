output "KKE_vpc_name" {
    description = "Name of the VPC created for KKE"
    value       = aws_vpc.nautilus-priv-vpc.tags["Name"]
}

output "KKE_subnet_name" {
    description = "Name of the subnet created for KKE"
    value       = aws_subnet.nautilus-priv-subnet.tags["Name"]
}

output "KKE_ec2_private" {
    description = "Name of the EC2 instance created for KKE"
    value       = aws_instance.nautilus-priv-ec2.tags["Name"]
}