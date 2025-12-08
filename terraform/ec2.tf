resource "aws_instance" "web" {
  ami           = "ami-0fa3fe0fa7920f68e"  # Amazon Linux 2
  instance_type = "t2.micro"
  key_name      = "my-ssh-key"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # Install Docker & run ECR image
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user
              curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
              unzip awscliv2.zip
              ./aws/install
              $(aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${aws_ecr_repository.flask_repo.repository_url})
              docker pull ${aws_ecr_repository.flask_repo.repository_url}:latest
              docker run -d -p 80:8080 ${aws_ecr_repository.flask_repo.repository_url}:latest
              EOF

  depends_on = [aws_ecr_repository.flask_repo]

  tags = {
    Name = "WebServer"
  }
}

