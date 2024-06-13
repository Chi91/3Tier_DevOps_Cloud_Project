resource "aws_instance" "ec2-instance" {
  for_each = var.instances

  vpc_security_group_ids = [aws_security_group.default_sg_devops_infrastructure_automation.id]
  subnet_id = aws_subnet.subnet["private_subnet_backend"].id

  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.ssh_key_name
  availability_zone           = aws_subnet.subnet["private_subnet_backend"].availability_zone
  associate_public_ip_address = each.value.associate_public_ip_address

  tags = {
    Name = each.value.ec2_name
  }
}

