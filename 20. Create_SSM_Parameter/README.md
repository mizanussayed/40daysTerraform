# Create_SSM_Parameter

The Nautilus DevOps team needs to create an SSM (Systems Manager) parameter in AWS with the following requirements:

1) The name of the parameter should be xfusion-ssm-parameter.

2) Set the parameter type to String.

3) Set the parameter value to xfusion-value.

4) The parameter should be created in the us-east-1 region.

5) Ensure the parameter is successfully created using terraform and can be retrieved when the task is completed.

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_ssm_parameter" "xfusion_param" {
  name  = "xfusion-ssm-parameter"
  type  = "String"
  value = "xfusion-value"
}
```
## verify:

```bash
aws ssm get-parameter --name "xfusion-ssm-parameter" --region us-east-1
```

## Note:
 SSM is used to store configuration data and secrets, allowing applications to retrieve them securely at runtime. It helps in managing and automating the retrieval of sensitive information without hardcoding it in the application code.



