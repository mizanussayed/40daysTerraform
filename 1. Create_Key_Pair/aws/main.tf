terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "aws_key" {
  key_name   = "my-aws-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

output "key_pair_name" {
  value = aws_key_pair.aws_key.key_name
}
