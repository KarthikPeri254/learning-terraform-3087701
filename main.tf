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
  # Use the dynamic data source we discussed to avoid "Malformed ID" errors
  ami           = data.aws_ami.latest_linux.id 
  
  # CHANGE THIS: Only use t2.micro or t3.micro
  instance_type = "t2.micro" 

  # ADD THIS: Student labs often require a specific IAM role
  iam_instance_profile = "LabInstanceProfile" 

  tags = {
    Name = "MyLabInstance"
  }
}
