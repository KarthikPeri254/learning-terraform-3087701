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
  ami           = data.aws_ami.app_ami.id # Ensure this AMI is also 'Free Tier Eligible'
  instance_type = "t2.micro"    # Change "t3.nano" to "t2.micro"
  
  tags = {
    Name = "MyFreeInstance"
  }
}
