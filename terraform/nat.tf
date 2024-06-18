/*resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc_devops_infrastructure_automation.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
}
*/
resource "aws_route_table_association" "associate_private_subnets" {
  for_each       = toset(["frontend", "backend", "postgres", "loadbalancer"])
  subnet_id      = aws_subnet.subnet[each.key].id
  route_table_id = aws_route_table.public_route_table.id
  # route_table_id = aws_route_table.private_route_table.id

}

/*
resource "aws_eip" "eip" {
  tags = {
    Name = "eip-${var.project_name}"
  }
}

resource "aws_nat_gateway" "nat" {
  subnet_id     = aws_subnet.subnet["loadbalancer"].id
  allocation_id = aws_eip.eip.id
  tags = {
    Name = "nat-${var.project_name}"
  }
}
*/