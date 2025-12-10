resource "aws_instance" "web" {
  ami                    = "ami-00e428798e77d38d9"  # Amazon Linux 2
  instance_type          = "t2.micro"
  key_name               = "my-ssh-key"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install docker* -y
              sudo systemctl start docker
              sudo usermod -a -G docker ec2-user
	      sudo hostnamectl set-hostname weberver
              # Install AWS CLI v2
              curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
              unzip awscliv2.zip
              ./aws/install

              # Login to ECR
              aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin ${aws_ecr_repository.flask_repo.repository_url}
              
              # Pull and run latest image
              #docker pull ${aws_ecr_repository.flask_repo.repository_url}:latest
              #docker run -d -p 8080:8080 ${aws_ecr_repository.flask_repo.repository_url}:latest
              EOF

  depends_on = [aws_ecr_repository.flask_repo]

  tags = {
    Name = "WebServer"
  }
}

