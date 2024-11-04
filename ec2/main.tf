provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "aws_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "ec2_sg" {
  name        = "${var.instance_name}-sg"
  description = "Security group for EC2 instance ${var.instance_name}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}

resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name              = aws_key_pair.aws_key.key_name

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = "gp3"
    delete_on_termination = true
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = var.ebs_volume_size
    volume_type = "gp3"
    delete_on_termination = true
  }

  tags = merge(
    var.tags,
    {
      "Name"   = var.instance_name
      "Cost"   = var.project_name
      "Project" = var.project_name
    }
  )
}
