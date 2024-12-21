provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "notes_app" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "ReactNotesApp-Instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              curl -fsSL https://rpm.nodesource.com/setup_16.x | sudo bash -
              sudo yum install -y nodejs git
              EOF
}

output "instance_ip" {
  value = aws_instance.notes_app.public_ip
}
