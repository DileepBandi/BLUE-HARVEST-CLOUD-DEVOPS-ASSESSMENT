provider "aws" {
region = "eu-west-2"
}

resource "aws_instance" "one" {
  ami             = "ami-09cce85cf54d36b29"
  instance_type   = "t2.micro"
  key_name        = "project_keypair"
}
