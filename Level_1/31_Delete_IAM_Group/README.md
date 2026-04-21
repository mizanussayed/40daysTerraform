# Delete_IAM_Group
## 🎯 task:
The Nautilus DevOps team is currently engaged in a cleanup process, focusing on removing unnecessary data and services from their AWS account. As part of the migration process, several resources were created for one-time use only, necessitating a cleanup effort to optimize their AWS environment.

Delete an IAM group named iamgroup_james using terraform. Make sure to keep the provisioning code, as we might need to provision this instance again later.

## 🧑‍💻 previous main.tf code:
```hcl
resource "aws_iam_group" "this" {
  name = "iamgroup_james"
}
```
## 🧑‍💻 commands to run:
```bash
terraform destroy -target=aws_iam_group.this
# Verify the group is deleted
aws iam get-group --group-name iamgroup_james
```
