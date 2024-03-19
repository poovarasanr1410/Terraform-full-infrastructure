# key_pair creation automatically both public and private key public for aws and private for client:

resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}
# creating private key download in our own system
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
#local file creation in system to download the private key 
resource "local_file" "TF_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "terraform_key"
}