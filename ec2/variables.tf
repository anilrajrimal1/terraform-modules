variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "project_name" {
  description = "Name of project the EC2 instance for"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access to the instance"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
}

variable "tags" {
  description = "Additional tags to add to the instance"
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  description = "AWS region for the provider"
  type        = string
  default     = "ap-south-1"
}

variable "root_volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 20
}

variable "ebs_volume_size" {
  description = "Size of the additional EBS volume in GB"
  type        = number
  default     = 30
}
