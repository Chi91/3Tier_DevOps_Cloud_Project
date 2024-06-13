resource "aws_subnet" "subnet" {
  for_each = var.subnets
  vpc_id                  = aws_vpc.vpc_devops_infrastructure_automation.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch

  tags = {
    Name = each.value.name
  }
}