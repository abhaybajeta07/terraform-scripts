variable "REGION" {
  default = "ap-south-1"
}

variable "ZONE1" {
  default = "ap-south-1a"
}

variable "AMI" {
  type = map(any)
  default = {
    ap-south-1 = "ami-06489866022e12a14"
    us-east-1  = "ami-05fa00d4c63e32376"
  }
}

variable "USER" {
  default = "ec2-user"
}