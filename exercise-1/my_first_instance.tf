provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "myec2" {
  ami                    = "ami-06489866022e12a14"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  key_name               = "love-key"
  vpc_security_group_ids = ["sg-048a8b03e10e98059"]
  tags = {
    Name = "Love-instance"
  }

}