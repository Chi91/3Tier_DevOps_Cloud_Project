vpc_cidr = "192.168.0.0/16"
region   = "eu-west-2"

instances = {
  loadbalancer = {
    public_ip         = true
    availability_zone = "eu-west-2c"
  }
  frontend = {
    public_ip         = false
    availability_zone = "eu-west-2a"
  }
  backend = {
    public_ip         = false
    availability_zone = "eu-west-2b"
  }
  postgres = {
    public_ip         = false
    availability_zone = "eu-west-2b"
  }
}
ssh_key = "my-key"

inbound_rules = {
  HTTP = {
    description = "Allow all HTTP traffic"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  SSH = {
    description = "Allow all SSH traffic"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  local = {
    description = "Allow all local traffic"
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["192.168.0.0/16"]
  }
}

# Canonical, Ubuntu, 24.04 LTS, for 'eu-west-2'
ami_id        = "ami-053a617c6207ecc7b"
instance_type = "t2.micro"
