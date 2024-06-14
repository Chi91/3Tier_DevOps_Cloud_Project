resource "aws_instance" "Loadbalancer" {
  vpc_security_group_ids = [aws_security_group.default_sg_devops_infrstructure_automation.id]
  ami                    = "ami-01e444924a2233b07"
  instance_type          = "t2.micro"
  key_name               = "my-key"
  subnet_id = aws_subnet.loadbalancer-subnet.id
  associate_public_ip_address =true
  tags = {
    Name = "Loadbalancer"
  }



}

resource "aws_subnet" "loadbalancer-subnet" {
  vpc_id     = aws_vpc.vpc_devops_infrastructure_automation.id
  cidr_block = "192.168.0.0/24"
# instances launched in the subnet are assigned a public IP address automatically. true ensures that any EC2 instance launched in this subnet will be assigned a public IP address upon creation
  map_public_ip_on_launch = true      
  tags = {
    Name = "loadbalancer-subnet"
  }
}
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