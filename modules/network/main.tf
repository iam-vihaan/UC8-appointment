resource "aws_vpc" "kasi_hcl_vpc" {
  cidr_block           = var.aws_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name       = "kasi_hcl_vpc"
    Environment = "Dev"
  }
}

resource "aws_subnet" "hcl_public_subnet" {
  vpc_id            = aws_vpc.kasi_hcl_vpc.id
  cidr_block        = var.aws_public_subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name       = "hcl_public_subnet"
    Environment = "Dev"
  }
}

resource "aws_subnet" "hcl_private_subnet" {
  vpc_id            = aws_vpc.kasi_hcl_vpc.id
  cidr_block        = var.aws_private_subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name       = "hcl_private_subnet"
    Environment = "Dev"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.kasi_hcl_vpc.id
  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.hcl_public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.kasi_hcl_vpc.id
  tags = {
    Name = "InternetGateway"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

resource "aws_security_group" "Public_SG" {
  vpc_id = aws_vpc.kasi_hcl_vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.2.0/24"] # Replace with trusted IP range
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name       = "Public_SG"
    Environment = "Dev"
    Owner      = "YourName"
  }
}

resource "aws_security_group" "Private_SG" {
  vpc_id = aws_vpc.kasi_hcl_vpc.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.1.0/24"] # Restrict to public subnet CIDR
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name       = "Private_SG"
    Environment = "Dev"
    Owner      = "YourName"
  }
}

resource "aws_iam_role" "vpc_role" {
  name               = "vpc_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "hcl_policy" {
  name        = "hcl_policy"
  description = "Policy to allow VPC management"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:CreateVpc",
          "ec2:DeleteVpc",
          "ec2:DescribeVpcs",
          "ec2:CreateSubnet",
          "ec2:DeleteSubnet",
          "ec2:DescribeSubnets",
          "ec2:CreateSecurityGroup",
          "ec2:DeleteSecurityGroup",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:RevokeSecurityGroupIngress",
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:RevokeSecurityGroupEgress"
        ]
        Effect   = "Allow"
        Resource = "*" # Refine this to specific resources if possible
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "vpc_role_policy_attachment" {
  role       = aws_iam_role.vpc_role.name
  policy_arn = aws_iam_policy.hcl_policy.arn
}
