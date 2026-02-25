### create a key pair using Terraform with the following requirements:
- Name of the key pair should be xfusion-kp.
- Key pair type must be rsa.
- The private key file should be saved under /home/bob/xfusion-kp.pem.
- The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.


```hcl
resource "aws_key_pair" "xfusion" {
  key_name   = "xfusion-kp"
  public_key = tls_private_key.xfusion.public_key_openssh
}

resource "tls_private_key" "xfusion" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "xfusion_pem" {
  content  = tls_private_key.xfusion.private_key_pem
  filename = "/home/bob/xfusion-kp.pem"

  provisioner "local-exec" {
    command = "chmod 600 /home/bob/xfusion-kp.pem"
  }
}
```

```hcl 
provider "aws" {
  region = "us-east-1"
}


## verify the key pair is created successfully by running the following command in the terminal:
terraform init
terraform apply
```
