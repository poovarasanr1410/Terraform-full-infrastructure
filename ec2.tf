resource "aws_instance" "Terraform" {
  ami                     = "ami-013168dc3850ef002"
  instance_type           = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.pubsub.id
  #key_name = "demo"
  key_name  = "TF_key"
  iam_instance_profile = aws_iam_instance_profile.instance_role_profile.id
  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing httpd"
  sudo yum update -y
  sudo yum install httpd -y
  sudo systemctl start httpd
  echo "*** Completed Installing httpd"
  EOF
  tags = {
    Name = "Terraform"
  }
  
}
resource "aws_instance" "Private_Terraform" {
  ami                     = "ami-013168dc3850ef002"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.prisub.id
  iam_instance_profile = aws_iam_instance_profile.instance_role_profile.id
  tags = {
    Name = "Private_Terraform"
  }
  
}
