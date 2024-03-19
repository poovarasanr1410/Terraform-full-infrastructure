# Route table Creartion public
resource "aws_route_table" "pubrt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "pubrt"
  }
}
# Route table Association public-subnet
resource "aws_route_table_association" "pubrtassoci" {
  subnet_id      = aws_subnet.pubsub.id
  route_table_id = aws_route_table.pubrt.id
}


# Route table Creartion private
resource "aws_route_table" "prirt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "prirt"
  }
}
# Route table Association private-subnet
resource "aws_route_table_association" "prirtassoci" {
  subnet_id      = aws_subnet.prisub.id
  route_table_id = aws_route_table.prirt.id
}

