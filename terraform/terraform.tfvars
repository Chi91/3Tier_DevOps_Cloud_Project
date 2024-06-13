vpc_name = "vpc_devops_infrastructure_automation_test"
vpc_cidr = "192.168.0.0/16"

subnets = {

  private_subnet_backend = {
    map_public_ip_on_launch = true  # //TODO: Should be false in the future
    cidr_block              = "192.168.2.0/24"
    availability_zone       = "eu-central-1b"
    name                    = "private_subnet_backend"
  }
}

route_table_name = "route_table_backend"
default_security_group_name = "default_security_group_name"

private_subnet_backend_cidr = "192.168.2.0/24"

instances = {

    backend = {
      availability_zone           = "eu-central-1b"
      associate_public_ip_address = true
      ec2_name                    = "ec2-backend"
  }
}

ami_id        = "ami-01e444924a2233b07"
instance_type = "t2.micro"
ssh_key_name  = "olha-aws-eu-central-1-ssh-key"
