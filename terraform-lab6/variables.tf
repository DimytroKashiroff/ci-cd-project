variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "key_name" {
  default = "terraform-key"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-04169656fea786776"  # Ubuntu в Frankfurt, перевір!
}