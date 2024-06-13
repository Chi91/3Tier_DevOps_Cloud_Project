resource "aws_subnet" "subnet_postgres" {
  vpc_id            = aws_vpc.vpc_devops_infrastructure_automation.id
  cidr_block        = "192.168.3.0/24"
  availability_zone = "eu-central-1c"
  tags = {
    Name = "subnet_postgres"

  }
}

resource "aws_instance" "EC2_postgres" {
  ami                    = "ami-01e444924a2233b07"
  instance_type          = "t2.micro"
  key_name               = "mykey-annika"
  subnet_id              = aws_subnet.subnet_postgres.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.default_sg_devops_infrastructure_automation.id]
  tags = {
    Name = "EC2_postgres"
  }
}