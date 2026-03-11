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
  ami           = "ami-0cf2b4e02406b4739" # Amazon Linux 2023 in Oregon
  instance_type = "t2.micro"               # OR "t3.micro"
  
  tags = {
    Name = "Student-Lab-Instance"
  }
}
