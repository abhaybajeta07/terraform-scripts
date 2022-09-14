resource "aws_key_pair" "love-key" {
  key_name   = "lovekey"
  public_key = file("lovekey.pub")
}

resource "aws_instance" "love-inst" {
  ami                    = var.AMI[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.love-key.key_name
  vpc_security_group_ids = ["sg-048a8b03e10e98059"]
  tags = {
    Name    = "Love-Instance"
    Project = "Love"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("lovekey")
    host        = self.public_ip
  }
}