provider "aws" {
region = "eu-west-2"
}

resource "aws_instance" "one" {
  ami             = "ami-09cce85cf54d36b29"
  instance_type   = "t2.micro"
  key_name        = "project_keypair"
  vpc_security_group_ids = [aws_security_group.five.id]
  availability_zone = "eu-west-2"
