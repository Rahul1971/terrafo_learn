provider "aws" {
  region="us-east-1"
}
resource "aws_instance" "testserver" {
  ami="ami-0c7af5fe939f2677f"
  instance_type="t2.micro"

  tags = {
    Name="testser"
  }
}