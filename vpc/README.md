# 🌐 Terraform VPC Module

This Terraform module provisions an Amazon Virtual Private Cloud (VPC) with customizable subnets, an Internet Gateway, and a NAT Gateway. It is designed to provide a secure and scalable network infrastructure for your AWS resources. 🚀


## 🛠️ Features
- Creates a customizable VPC with a specified CIDR block.
- Supports multiple public and private subnets across different availability zones.
- Includes an Internet Gateway for public subnet access.
- Sets up a NAT Gateway for outbound internet access from private subnets.

## 🔧 Input Variables
| Variable                  | Description                                             | Type         | Default              |
|--------------------------|---------------------------------------------------------|--------------|----------------------|
| `aws_region`             | AWS region for the provider                             | string       | `ap-south-1`        |
| `vpc_cidr`               | CIDR block for the VPC                                 | string       | `10.0.0.0/16`       |
| `vpc_name`               | Name of the VPC                                        | string       |                      |
| `public_subnet_count`    | Number of public subnets to create                      | number       | `1`                  |
| `private_subnet_count`   | Number of private subnets to create                     | number       | `1`                  |
| `public_subnet_cidrs`    | List of CIDR blocks for public subnets                 | list(string) | `["10.0.1.0/24"]`   |
| `private_subnet_cidrs`   | List of CIDR blocks for private subnets                | list(string) | `["10.0.2.0/24"]`   |
| `availability_zones`     | List of availability zones for the VPC                 | list(string) | `["ap-south-1a", "ap-south-1b"]` |
| `tags`                   | Additional tags to apply to the VPC and subnets        | map(string)  | `{}`                 |

## 🏗️ Outputs
- `vpc_id`: ID of the created VPC
- `public_subnet_ids`: IDs of the public subnets
- `private_subnet_ids`: IDs of the private subnets
- `internet_gateway_id`: ID of the Internet Gateway
- `nat_gateway_id`: ID of the NAT Gateway

## 📚 Usage
To use this module, include it in your Terraform configuration like this:

```hcl
module "vpc" {
  source              = "./vpc"
  vpc_name            = "my-vpc"
  public_subnet_count = 2
  private_subnet_count = 2
  # Additional variables as needed
}
```

## 🚀 Getting Started
- Clone the repository.
- Navigate to the vpc directory.
- Modify variables in variables.tf as needed.
- Run terraform init to initialize the module.
- Execute `terraform apply` to create the VPC and associated resources.

Happy cloud provisioning! ☁️✨