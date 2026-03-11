data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}



resource "aws_instance" "web" {
  ami           = "ami-053b0d53c279acc90" # This is the valid ID for us-east-1
  instance_type = "t2.micro"               # Stay on t2.micro for the Lab
  
  tags = {
    Name = "Lab-Server"
  }
}
