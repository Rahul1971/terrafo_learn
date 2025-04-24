terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}
provider "aws" {
  region="us-east-1"

}

resource "aws_security_group" "ssh_access" {
  name_prefix = "allow_ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Use your IP CIDR for better security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_key_pair" "example" {
  key_name   = "all" # Change this to your desired key name# Path to the public key file (typically generated with ssh-keygen)
  public_key = ""
}


resource "aws_instance" "testserve2" {
  ami="ami-0c7af5fe939f2677f"
  instance_type="t2.micro"
  

  tags = {
    Name="testser2"
  }
}