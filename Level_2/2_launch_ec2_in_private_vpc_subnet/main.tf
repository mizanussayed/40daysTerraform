resource "aws_vpc" "nautilus-priv-vpc" {
    cidr_block = "${var.KKE_VPC_CIDR}"
    tags = {
        Name = "nautilus-priv-vpc"
    }
}

resource "aws_subnet" "nautilus-priv-subnet" {
    vpc_id     = aws_vpc.nautilus-priv-vpc.id
    cidr_block = "${var.KKE_SUBNET_CIDR}"
    map_public_ip_on_launch = false
    tags = {
        Name = "nautilus-priv-subnet"
    }
}

resource "aws_security_group" "nautilus-priv-sg" {
    name        = "nautilus-priv-sg"
    description = "Allow traffic only from within the VPC CIDR"
    vpc_id      = aws_vpc.nautilus-priv-vpc.id

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [var.KKE_VPC_CIDR]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "nautilus-priv-sg"
    }
}

resource "aws_instance" "nautilus-priv-ec2" {
    ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM), SSD Volume Type
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.nautilus-priv-subnet.id
    vpc_security_group_ids = [aws_security_group.nautilus-priv-sg.id]
    tags = {
        Name = "nautilus-priv-ec2"
    }
}

