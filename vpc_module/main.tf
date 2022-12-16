#Pulling a list of all the Availabiltiy zones in us-east-1
data "aws_availability_zones" "available" {
  state = "available"
}

#Creating a vpc resource with a cidr block of 10.0.0.0/16
resource "aws_vpc" "myvpc" {

  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_tag
  }

}

#Creating an Internet Gateway for my vpc
resource "aws_internet_gateway" "myigw" {

  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_eip" "eip" {

  vpc = true
}

#Creating a NAT Gateway for my bastion subnet us-east-1a
resource "aws_nat_gateway" "myNATgw" {
  # count = 2
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.bastion_subnets.*.id[0]

  tags = {
    Name = var.nat_tag
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.myigw]
}

#Creating 2 Public subnets for my bastion server
resource "aws_subnet" "bastion_subnets" {

  count = 2

  vpc_id                  = aws_vpc.myvpc.id
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = var.bastion_subnet_cidr[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.bastion_subnet_names[count.index]
  }
}

#Creating a route table for my bastion subnets 
resource "aws_route_table" "bastion_route" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = var.bastion_route_name
  }
}

#Associating my web Subnets to my bastion route table
resource "aws_route_table_association" "bastion_rt_subs" {
  count          = 2
  subnet_id      = aws_subnet.bastion_subnets.*.id[count.index]
  route_table_id = aws_route_table.bastion_route.id
}

#Creating 2 Private Subnets for my web instances
resource "aws_subnet" "web_subnets" {

  count = 2

  vpc_id            = aws_vpc.myvpc.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = var.web_subnet_cidr[count.index]

  tags = {
    Name = var.web_subnet_names[count.index]
  }
}

#Creating a route table for my web subnets 
resource "aws_route_table" "web_route" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.myNATgw.id
  }

  tags = {
    Name = var.web_route_name
  }
}

resource "aws_route_table_association" "web_rt_subs" {
  count          = 2
  subnet_id      = aws_subnet.web_subnets.*.id[count.index]
  route_table_id = aws_route_table.web_route.id
}



#Creating 2 Private Subnets for my Data tier
resource "aws_subnet" "db_subnets" {

  count = 2

  vpc_id            = aws_vpc.myvpc.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = var.db_subnet_cidr[count.index]

  tags = {
    Name = var.db_subnet_names[count.index]
  }
}

#Creating a Subnet Group for my Data tier
resource "aws_db_subnet_group" "db_subnet_group" {
  name = var.db_sub_group_name
  subnet_ids = aws_subnet.db_subnets.*.id
}

#Creating a route table for my Database tier
resource "aws_route_table" "db_route" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.myNATgw.id
  }

  tags = {
    Name = var.db_route_name
  }
}

#Associating my Private Subnets to my Database Route table
resource "aws_route_table_association" "db_rt_subs" {
  count          = 2
  subnet_id      = aws_subnet.db_subnets.*.id[count.index]
  route_table_id = aws_route_table.db_route.id
}
