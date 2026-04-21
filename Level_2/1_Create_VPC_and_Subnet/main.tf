resource "aws_vpc" "nautilus_vpc" {
  cidr_block = "10.0.0.0/16"

    tags = {
        Name = var.KKE_VPC_NAME
    }
  
}

resource "aws_subnet" "nautilus_subnet" {
  vpc_id     =  aws_vpc.nautilus_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = var.KKE_SUBNET_NAME
  }
}