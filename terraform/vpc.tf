resource "aws_vpc" "vpc_devops_infrastructure_automation" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "vpc_${var.project_name}"
  }

}

