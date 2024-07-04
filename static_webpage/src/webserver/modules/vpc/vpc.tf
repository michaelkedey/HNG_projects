provider "aws" {
  region = "us-east-1"
  alias  = "region"
}

#vpc
resource "aws_vpc" "hng_vpc" {
  cidr_block = var.vpc_cidr
  provider   = aws.region
  tags = {
    Name = var.vpc_name
  }
}


resource "aws_subnet" "hng_subnet" {
  vpc_id            = aws_vpc.hng_vpc.id
  cidr_block        = var.subnet_cidr
  provider          = aws.region
  availability_zone = var.azs[0]
  tags = {
    Name = var.subnet_name
  }
}



# Security group for the EC2 instance
resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.hng_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#internet gateway
resource "aws_internet_gateway" "hng_internet_gateway" {
  vpc_id = aws_vpc.hng_vpc.id
  tags = {
    Name = var.igw_name
  }
}

#public route table
resource "aws_route_table" "hng_route_table" {
  vpc_id = aws_vpc.hng_vpc.id
  route {
    cidr_block = var.default_cidr
    gateway_id = aws_internet_gateway.hng_internet_gateway.id
  }
}

#associate public rt with public subnet
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.hng_subnet.id
  route_table_id = aws_route_table.hng_route_table.id
}



output "subnet_id" {
  value = aws_subnet.hng_subnet.id
}

output "sg" {
  value = aws_security_group.web_sg.id
}