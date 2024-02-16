# Create a route table for public subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "Public Route Table"
  }
}

# Create a route table for private subnets
resource "aws_route_table" "private_route_table_0" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_0.id
  }
  tags = {
    Name = "Private Route Table"
  }
}

# Create a route table for private subnets
resource "aws_route_table" "private_route_table_1" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_1.id
  }
  tags = {
    Name = "Private Route Table"
  }
}

# Associate public subnet in us-east-1a with internet gateway in us-east-1a
resource "aws_route_table_association" "public_subnet_association_0" {
  subnet_id      = aws_subnet.public_subnet_0.id
  route_table_id = aws_route_table.public_route_table.id
}

# Associate public subnet in us-east-1b with internet gateway in us-east-1b
resource "aws_route_table_association" "public_subnet_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

# Associate private subnet in us-east-1a with NAT gateway in us-east-1a
resource "aws_route_table_association" "private_subnet_association_0" {
  subnet_id      = aws_subnet.private_subnet_0.id
  route_table_id = aws_route_table.private_route_table_0.id
}

# Associate private subnet in us-east-1b with NAT gateway in us-east-1b
resource "aws_route_table_association" "private_subnet_association_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table_1.id
}