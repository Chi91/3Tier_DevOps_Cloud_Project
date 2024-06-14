resource "aws_internet_gateway" "loadbalancer_igw" {
  vpc_id = aws_vpc.vpc_devops_infrastructure_automation.id
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_devops_infrastructure_automation.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.loadbalancer_igw.id
  }
}