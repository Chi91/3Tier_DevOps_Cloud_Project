resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_devops_infrastructure_automation.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "associate_subnets" {
    for_each = var.instances
    subnet_id      = aws_subnet.subnet[each.key].id
    route_table_id = aws_route_table.public_route_table.id
    
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_devops_infrastructure_automation.id
  tags = {
    Name = "igw-${var.project_name}"
  }
}
