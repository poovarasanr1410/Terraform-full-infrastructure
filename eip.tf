# Creating Elastic IP
resource "aws_eip" "elasticIP" {
 
  domain   = "vpc"
}