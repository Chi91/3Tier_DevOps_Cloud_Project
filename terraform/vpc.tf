resource "aws_vpc" "vpc_devops_infrastructure_automation" {
  cidr_block = "192.168.0.0/16"
  tags = {
    "Name" = "vpc_devops_infrastructure_automation"
  }

}

resource "aws_security_group" "default_sg_devops_infrstructure_automation" {
  name        = "allow_HTTP_SSH"
  description = "allow HTTP and SSH inboud traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_devops_infrastructure_automation.id

  ingress {
    description = "Allow all HTTP traffic"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow all SSH traffic"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow all local traffic"
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = [aws_vpc.vpc_devops_infrastructure_automation.cidr_block]
  }
  egress {
    description = "Allow all traffic"
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "default_outbound_rule"
  }

}