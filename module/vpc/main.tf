resource "aws_vpc" "main_vpc" {
  count                   = "${terraform.workspace == "prod" || terraform.workspace == "dev" ? 1 : 0}"
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = "true"
  tags = {
    Name = ""
  }
}

#VPC Internet Gateway
resource "aws_internet_gateway" "internet_gw" {
  count                   = "${terraform.workspace == "prod" || terraform.workspace == "dev" ? 1 : 0}"
  vpc_id = aws_vpc.main_vpc.0.id
}
#VPC NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  count                   = "${terraform.workspace == "prod" || terraform.workspace == "dev" ? 1 : 0}"
  allocation_id = aws_eip.nat_eip.0.id
  subnet_id     = aws_subnet.public_sub1.0.id

  tags = {
    Name = ""
  }
}
resource "aws_eip" "nat_eip" {
  count                   = "${terraform.workspace == "prod" || terraform.workspace == "dev" ? 1 : 0}"
  vpc   = true
}

# VPC Subnets
#Privatet Subnets
resource "aws_subnet" "private_sub1" {
  count                   = "${terraform.workspace == "prod" || terraform.workspace == "dev" ? 1 : 0}"
  vpc_id            = aws_vpc.main_vpc.0.id
  cidr_block        = var.sub_private_cidr_1
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = ""
  }
}
resource "aws_subnet" "private_sub2" {
  count                   = "${terraform.workspace == "prod" || terraform.workspace == "dev" ? 1 : 0}"
  vpc_id            = aws_vpc.main_vpc.0.id
  cidr_block        = var.sub_private_cidr_2
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = ""
  }
}
#Public Subnets
resource "aws_subnet" "public_sub1" {
  count                   = "${terraform.workspace == "prod" || terraform.workspace == "dev" ? 1 : 0}"
  vpc_id            = aws_vpc.main_vpc.0.id
  cidr_block        = var.sub_public_cidr_1
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = ""
  }
}


#VPC Route Tables
#Public Route Table and Association
resource "aws_route_table" "route_public" {
  count                   = "${terraform.workspace == "prod" || terraform.workspace == "dev" ? 1 : 0}"
  vpc_id = aws_vpc.main_vpc.0.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.0.id
  }
  tags = {
    Name = ""
  }
}


#Private Route Table and Association
resource "aws_route_table" "route_private" {
  count                   = "${terraform.workspace == "prod" || terraform.workspace == "dev" ? 1 : 0}"
  vpc_id = aws_vpc.main_vpc.0.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.0.id
  }
  tags = {
    Name = ""
  }
}
resource "aws_route_table_association" "route_private_sub1_association" {
  count                   = "${terraform.workspace == "prod" || terraform.workspace == "dev" ? 1 : 0}"
  subnet_id      = aws_subnet.private_sub1.0.id
  subnet_id      = aws_subnet.private_sub2.0.id
  route_table_id = aws_route_table.route_private.0.id
}
resource "aws_route_table_association" "route_private_sub2_association" {
  count                   = "${terraform.workspace == "prod" || terraform.workspace == "dev" ? 1 : 0}"
  subnet_id      = aws_subnet.private_sub2.0.id
  route_table_id = aws_route_table.route_private.0.id
}
resource "aws_route_table_association" "route_public_sub1_association" {
  count                   = "${terraform.workspace == "prod" || terraform.workspace == "dev" ? 1 : 0}"
  subnet_id      = aws_subnet.public_sub1.0.id
  route_table_id = aws_route_table.route_public.0.id
  
}
