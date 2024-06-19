resource "aws_instance" "EC2_instance" {
  for_each = var.instances

  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.ssh_key
  associate_public_ip_address = var.instances[each.key].public_ip
  availability_zone           = var.instances[each.key].availability_zone
  subnet_id                   = aws_subnet.subnet[each.key].id
  vpc_security_group_ids      = [aws_security_group.default_sg.id] //private still needs to be build

  tags = {
    Name = each.key
  }
}



