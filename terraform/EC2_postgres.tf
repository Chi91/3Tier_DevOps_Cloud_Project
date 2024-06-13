resource "aws_instance" "EC2_postgres" {
  ami                         = "ami-01e444924a2233b07"
  instance_type               = "t2.micro"
  key_name                    = "mykey-annika"
  associate_public_ip_address = true // Change later to false
  vpc_security_group_ids      = [aws_security_group.default_sg_devops_infrastructure_automation.id]
  tags = {
    Name = "EC2_postgres"
  }
}