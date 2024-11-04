
# EC2 Terraform Module

This Terraform module creates an AWS EC2 instance with an associated security group and key pair. The instance includes customizable options for AMI, instance type, volumes, and tagging, making it adaptable for various environments and project needs.

## Module Contents
- **`main.tf`** - Defines the AWS provider, key pair, security group, and EC2 instance resources.
- **`variables.tf`** - Declares configurable variables for the EC2 instance.
- **`outputs.tf`** - Exposes the EC2 instance ID, public/private IP addresses, and security group ID.

## Usage

### Prerequisites
Ensure you have the following before using this module:
- AWS account with access to create EC2 instances and related resources.
- A valid SSH key pair file for secure access to the instance.

### Example Configuration

```hcl
module "ec2_instance" {
  source             = "./ec2"
  ami_id             = "ami-12345678"
  instance_type      = "t2.micro"
  subnet_id          = "subnet-0bb1c79de3EXAMPLE"
  vpc_id             = "vpc-0c3abc123EXAMPLE"
  instance_name      = "example-instance"
  project_name       = "example-project"
  key_name           = "example-key"
  public_key_path    = "~/.ssh/example-key.pub"
  tags               = {
    Environment = "dev"
  }
  aws_region         = "us-west-2"
  root_volume_size   = 20
  ebs_volume_size    = 30
}
```

### Inputs

| Name              | Description                                      | Type         | Default     |
|-------------------|--------------------------------------------------|--------------|-------------|
| `ami_id`          | AMI ID for the EC2 instance                      | `string`     | n/a         |
| `instance_type`   | Instance type for the EC2 instance               | `string`     | `"t2.micro"`|
| `subnet_id`       | Subnet ID for the instance                       | `string`     | n/a         |
| `vpc_id`          | VPC ID for the security group                    | `string`     | n/a         |
| `instance_name`   | Name of the EC2 instance                         | `string`     | n/a         |
| `project_name`    | Name of the project for the EC2 instance         | `string`     | n/a         |
| `key_name`        | Key pair name for SSH access                     | `string`     | n/a         |
| `public_key_path` | Path to the public key file                      | `string`     | n/a         |
| `tags`            | Additional tags to apply to the instance         | `map(string)`| `{}`        |
| `aws_region`      | AWS region for the provider                      | `string`     | `"ap-south-1"`|
| `root_volume_size`| Size of the root EBS volume (GB)                 | `number`     | `20`        |
| `ebs_volume_size` | Size of additional EBS volume (GB)               | `number`     | `30`        |

### Outputs

| Name                | Description                                      |
|---------------------|--------------------------------------------------|
| `instance_id`       | ID of the created EC2 instance                   |
| `public_ip`         | Public IP address of the EC2 instance            |
| `private_ip`        | Private IP address of the EC2 instance           |
| `security_group_id` | ID of the security group attached to the instance|

## Security Group Rules
- **HTTP (80):** Allows inbound traffic on port 80 from any IP.
- **HTTPS (443):** Allows inbound traffic on port 443 from any IP.
- **SSH (22):** Allows inbound traffic on port 22 from any IP (for development; restrict in production).
- **All Outbound Traffic:** Unrestricted.

## Notes
- Adjust the `ssh` ingress rule for security purposes, limiting access to known IP addresses if deploying in production.
- The EBS volume is optional and can be configured with different sizes or omitted if not needed.

## License
This module is provided as-is without warranty. Use at your own risk.