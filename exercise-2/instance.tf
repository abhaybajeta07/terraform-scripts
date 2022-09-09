resource "aws_instance" "love-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "love-key"
  vpc_security_group_ids = ["sg-048a8b03e10e98059"]
  tags = {
    Name = "Love-instance"
  }
}