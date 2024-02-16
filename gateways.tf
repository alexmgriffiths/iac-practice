# Define internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "Internet Gateway" }
}

# Create NAT gateway in us-east-1a
resource "aws_nat_gateway" "nat_gateway_0" {
  subnet_id     = aws_subnet.public_subnet_0.id
  allocation_id = aws_eip.nat_gateway_eip_0.id
  tags          = { Name = "NAT Gateway us-east-1a" }
  depends_on    = [aws_subnet.private_subnet_0, aws_eip.nat_gateway_eip_0, aws_internet_gateway.internet_gateway]
}

# Create NAT gateway in us-east-1b
resource "aws_nat_gateway" "nat_gateway_1" {
  subnet_id     = aws_subnet.public_subnet_1.id
  allocation_id = aws_eip.nat_gateway_eip_1.id
  tags          = { Name = "NAT Gateway us-east-1b" }
  depends_on    = [aws_subnet.private_subnet_1, aws_eip.nat_gateway_eip_1, aws_internet_gateway.internet_gateway]
}