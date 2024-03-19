# Creating Security rule 
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  tags = {
    Name = "allow_all"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_ssh" {
  security_group_id = aws_security_group.allow_all.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "allow_all_http" {
  security_group_id = aws_security_group.allow_all.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_ingress_rule" "allow_all_https" {
  security_group_id = aws_security_group.allow_all.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_all.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}