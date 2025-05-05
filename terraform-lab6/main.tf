resource "aws_key_pair" "deployer" {
  key_name   = "terraform-key"
  public_key = file("C:/Users/Dima/.ssh/terraform-key.pub")
}

resource "aws_security_group" "terraform_sg" {
  name_prefix = "terraform-sg-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y apache2
              echo "<h1>Terraform deployed this EC2!</h1>" | sudo tee /var/www/html/index.html
              sudo systemctl start apache2
              sudo systemctl enable apache2
              EOF

  tags = {
    Name = "TerraformInstance"
  }
}