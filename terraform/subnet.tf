resource "aws_subnet" "subnet" {
  for_each                = var.instances
  vpc_id                  = aws_vpc.vpc_devops_infrastructure_automation.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, var.instances[each.key].index)
  availability_zone       = var.instances[each.key].availability_zone
  map_public_ip_on_launch = var.instances[each.key].public_ip

  tags = {
    Name = each.key
  }
}