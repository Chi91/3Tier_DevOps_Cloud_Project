output "public_ip" {
  value = aws_instance.EC2_instance["loadbalancer"].public_ip

}
output "private_ip" {
    value = [for instance in aws_instance.EC2_instance : [instance.tags, instance.private_ip]]
}

