# create my key pair

resource "aws_key_pair" "deployer" {
  key_name   = "${var.name}-key"
  public_key = var.pub-key
}

# getting info from default vpc

data "aws_vpc" "default" {
  default = true
}



# create security group

resource "aws_security_group" "github-act" {
  name        = "github-act"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.name}-sg"
  }
}

# create my ec2 instance

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance-type
  key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.github-act.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y openjdk-11-jdk
    sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA
    sudo apt-get update
    sudo apt-get install -y jenkins
  EOF

  tags = {
    Name = "${var.name}-server"
  }
}