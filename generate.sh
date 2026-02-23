#!/bin/bash

folders=(
"Create_Key_Pair"
"Create_Security_Group"
"Create_VPC"
"Create_VPC_with_CIDR"
"Create_VPC_with_IPv6"
"Create_Elastic_IP"
"Create_EC2_Instance"
"Create_AMI"
"Create_EBS_Volume"
"Create_Snapshot"
"Create_Alarm"
"Create_Public_S3_Bucket"
"Create_Private_S3_Bucket"
"Create_IAM_User"
"Create_IAM_Group"
"Create_IAM_Policy"
"Create_DynamoDB_Table"
"Create_Kinesis_Stream"
"Create_SNS_Topic"
"Create_SSM_Parameter"
"CloudWatch_Setup"
"CloudFormation_Template_Deployment"
"OpenSearch_Setup"
"Secrets_Manager_Setup"
"Change_Instance_Type"
"Attach_Elastic_IP"
"Attach_Policy"
"Enable_S3_Versioning"
"Delete_Backup_from_S3"
"Delete_EC2_Instance"
"Delete_IAM_Group"
"Delete_IAM_Role"
"Delete_VPC"
"Copy_Data_to_S3"
"VPC_Variable_Setup"
"Security_Group_Variable_Setup"
"Elastic_IP_Variable_Setup"
"User_Variable_Setup"
"Role_Variable_Setup"
"Policy_Variable_Setup"
)

count=1

for folder in "${folders[@]}"
do
    dir_name="$count. $folder"
    mkdir -p "$dir_name"
    echo "# $folder" > "$dir_name/README.md"
    ((count++))
done

echo "✅ 40 numbered folders with README.md created successfully!"