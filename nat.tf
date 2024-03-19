# Creation NAT gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.elasticIP.id
  subnet_id     = aws_subnet.pubsub.id

  tags = {
    Name = "gw NAT"
  }
}