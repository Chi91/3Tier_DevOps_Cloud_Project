variable "vpc_name" {
  description = "Name of AWS VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR of AWS VPC"
  type        = string
}

variable "route_table_name" {
  description = "Name of AWS route table"
  type        = string
}

variable "default_security_group_name" {
  description = "Name of security group names"
  type        = string
}

variable "instances" {
  type = any
}

variable "instance_type" {
  description = "Type of AWS instance to deploy"
  type        = string
}

variable "ami_id" {
  description = "ID of amazon machine image"
  type        = string
}

variable "ssh_key_name" {
  description = "Path to public key"
  type        = string
  sensitive   = true
}

variable "subnets" {
  type = any
}

variable "private_subnet_backend_cidr" {
  description = "List of AWS subnets"
  type        = string
}

variable "availability_zone" {
  type = map(string)
  default = {
    private_subnet_backend_az = "eu-central-1b"
  }
}