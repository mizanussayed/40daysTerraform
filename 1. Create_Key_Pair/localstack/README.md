# Create Key Pair in LocalStack using Terraform

This guide creates an EC2 key pair in LocalStack.

## Prerequisites
- Terraform installed
- LocalStack running (`http://localhost:4566`)
- AWS CLI installed (optional)
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
AWS_ACCESS_KEY_ID=test AWS_SECRET_ACCESS_KEY=test AWS_DEFAULT_REGION=us-east-1 \
aws --endpoint-url=http://localhost:4566 ec2 describe-key-pairs
```

## 5) Destroy

```bash
terraform destroy -auto-approve
```

## 6) Create EC2 instance (`ec2_instance.tf`)

This folder also contains `ec2_instance.tf` to create one EC2 instance in LocalStack using the same key pair.

Apply:

```bash
terraform apply -auto-approve
```

Verify from Terraform output:

```bash
terraform output ec2_instance_id
```

Optional verify via LocalStack CLI:

```bash
localstack aws ec2 describe-instances --region us-east-1
```
