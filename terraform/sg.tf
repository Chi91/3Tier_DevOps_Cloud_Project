resource "aws_security_group" "default_sg" {
  name        = "allow all traffic"
  description = "allow HTTP and SSH inboud traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_devops_infrastructure_automation.id

  dynamic "ingress" {
    for_each = var.inbound_rules
    content {
      description = ingress.key
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress {
    description = "Allow all traffic"
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "default_sg"
  }

}