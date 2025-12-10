resource "aws_instance" "web" {
  ami                    = "ami-00e428798e77d38d9"  # Amazon Linux 2
  instance_type          = "t2.micro"
  key_name               = "basyuhi46"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
	      # Install AWS CLI v2
              curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
              unzip awscliv2.zip
              ./aws/install

              # Login to ECR
              #aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin ${aws_ecr_repository.flask_repo.repository_url}
              
              EOF

  depends_on = [aws_ecr_repository.flask_repo]

  tags = {
    Name = "WebServer"
  }
}

