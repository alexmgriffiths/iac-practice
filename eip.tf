# Allocate Elastic IPs for NAT gateways
resource "aws_eip" "nat_gateway_eip_0" {
  vpc = true
}

resource "aws_eip" "nat_gateway_eip_1" {
  vpc = true
}