resource "local_file" "ansible_hosts" {
  filename = "../ansible/hosts.yml"
  content  = <<EOF
load_balancer:
  hosts: 
    loadbalancer: 
      ansible_host: ${aws_instance.EC2_instance["loadbalancer"].public_ip}

webservers:
  hosts: 
    frontend: 
      ansible_host: ${aws_instance.EC2_instance["frontend"].public_ip}
    backend:
      ansible_host: ${aws_instance.EC2_instance["backend"].public_ip}

databases:
  hosts:
    postgres: 
      ansible_host: ${aws_instance.EC2_instance["postgres"].public_ip}

all:
  vars:
    ansible_user: ubuntu
    ansible_ssh_user: ubuntu
    ansible_connection: ssh
    ansible_ssh_private_key_file: ../my-key.pem
  EOF  
  //SSH-key "../my-key.pem" still needs to change
}
