variable "project_name" {
  description = "Name of Project"
  type        = string
  default     = "devops_automation"
}

variable "region" {
  description = "Region of AWS VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR of AWS VPC"
  type        = string
}

variable "instances" {
  type = map(object({ public_ip = bool, availability_zone = string }))
}

variable "ssh_key" {
  description = "Path to public key"
  type        = string
  sensitive   = true
}

variable "inbound_rules" {
  type = map(object({ from_port = number, to_port = number, protocol = string, cidr_blocks = tuple([string]) }))
}


