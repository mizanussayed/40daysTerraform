1. Create a VPC named `nautilus-priv-vpc` with the CIDR block 10.0.0.0/16.

2. Create a subnet named `nautilus-priv-subnet` inside the VPC with the CIDR block 10.0.1.0/24 and auto-assign IP option must not be enabled.

3. Create an EC2 instance named `nautilus-priv-ec2` inside the subnet and instance type must be t2.micro.

4. Ensure the security group of the EC2 instance allows access only from within the VPC's CIDR block.

5. Use variables.tf file with the following variable names:

- KKE_VPC_CIDR for the VPC CIDR block.
- KKE_SUBNET_CIDR for the subnet CIDR block.

6. Use the outputs.tf file with the following variable names:

- KKE_vpc_name for the name of the VPC.
- KKE_subnet_name for the name of the subnet.
- KKE_ec2_private for the name of the EC2 instance.
