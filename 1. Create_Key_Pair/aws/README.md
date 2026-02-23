# Create Key Pair in AWS using Terraform

This guide creates an EC2 key pair in AWS.

## Prerequisites
- Terraform installed
- AWS account
- AWS credentials configured (for example with `aws configure`)
- A local SSH public key file (for example `~/.ssh/id_rsa.pub`)

## 1) `main.tf`

## 2) Initialize

```bash
terraform init
```

## 3) Apply

```bash
terraform apply -auto-approve
```

## 4) Verify (optional)

```bash
aws ec2 describe-key-pairs --region us-east-1
```

## 5) Destroy

```bash
terraform destroy -auto-approve
```
