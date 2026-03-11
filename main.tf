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

# 1. This is the "Declaration" that is currently missing
data "aws_ami" "latest_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

# 2. Now this resource can successfully reference the ID above
resource "aws_instance" "web" {
  ami           = data.aws_ami.latest_linux.id
  instance_type = "t2.micro" 

  tags = {
    Name = "MyLabInstance"
  }
}
