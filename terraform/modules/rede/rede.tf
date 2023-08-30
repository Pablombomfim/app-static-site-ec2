# VPC
resource "aws_vpc" "vpc" {
    cidr_block           = "${var.vpc_cidr}"
    enable_dns_hostnames = "true"
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
}

# SUBNET
resource "aws_subnet" "sn_public" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone       = "us-east-1a"

}

# ROUTE TABLE
resource "aws_route_table" "rt_public" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

# SUBNET ASSOCIATION
resource "aws_route_table_association" "rt_public_To_sn_public" {
  subnet_id      = aws_subnet.sn_public.id  #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  route_table_id = aws_route_table.rt_public.id
}

# SECURITY GROUP
resource "aws_security_group" "vpc_sg_pub" {
    name        = "vpc_sg_public"
    vpc_id      = aws_vpc.vpc.id
    
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["10.0.0.0/16"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        description = "TCP/80 from All"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

#DynaboDb
module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = "tf-notifier-state-v1_do_pablinhos-jogatinas"
  hash_key = "LockID"

  attributes = [
    {
      name = "LockID"
      type = "N"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "staging"
  }
}

#bucketS3
resource "aws_s3_bucket" "tf-notifier-state-v1_do_pablinhos_gameplays" {
  bucket = "tf-notifier-state-v1_do_pablinhos_gameplays"
}



