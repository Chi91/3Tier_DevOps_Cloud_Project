vpc_cidr = "192.168.0.0/16"
region   = "eu-central-1"

instances = {
  loadbalancer = {
    public_ip         = true
    availability_zone = "eu-central-1c"
  }
  frontend = {
    public_ip         = false
    availability_zone = "eu-central-1a"
  }
  backend = {
    public_ip         = false
    availability_zone = "eu-central-1b"
  }
  postgres = {
    public_ip         = false
    availability_zone = "eu-central-1b"
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


