# Define public subnets
resource "aws_subnet" "public_subnet_0" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 1)
  availability_zone       = "us-east-1a"
  tags                    = { Name = "Public Subnet us-east-1a" }
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 2)
  availability_zone       = "us-east-1b"
  tags                    = { Name = "Public Subnet us-east-1b" }
  map_public_ip_on_launch = true
}

# Define private subnets
resource "aws_subnet" "private_subnet_0" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, 3)
  availability_zone = "us-east-1a"
  tags              = { Name = "Private Subnet us-east-1a" }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, 4)
  availability_zone = "us-east-1b"
  tags              = { Name = "Private Subnet us-east-1b" }
}