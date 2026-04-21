Create VPC and Subnet Using Terraform

## complete the following tasks:

1. Create a VPC named nautilus-vpc.

2. Create a Subnet named nautilus-subnet.

3. Ensure the Subnet uses the depends_on argument to explicitly depend on the VPC resource.

4. Create the main.tf file (do not create a separate .tf file) to provision a VPC and Subnet.

5. Use variables.tf, define the following variables:

    - KKE_VPC_NAME for the VPC name.
    - KKE_SUBNET_NAME for the Subnet name.
    
6. Use terraform.tfvars to input the names of the VPC and subnet.

7. In outputs.tf, output the following:

    - kke_vpc_name: The name of the VPC.
    - kke_subnet_name: The name of the Subnet.