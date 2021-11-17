resource "aws_instance" "web" {
  count = 2
  ami           = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}