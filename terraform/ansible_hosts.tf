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
      ansible_host: ${aws_instance.EC2_instance["frontend"].private_ip}
    backend:
      ansible_host: ${aws_instance.EC2_instance["backend"].private_ip}

databases:
  hosts:
    postgres: 
      ansible_host: ${aws_instance.EC2_instance["postgres"].private_ip}

private:
  children:
    webservers:
    databases:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -i ../my-key.pem ubuntu@${aws_instance.EC2_instance["loadbalancer"].public_ip} nc %h 22"'

all:
  vars:
    ansible_user: ubuntu
    ansible_ssh_user: ubuntu
    ansible_connection: ssh
    ansible_ssh_private_key_file: ../my-key.pem
  EOF  
  //SSH-key "../my-key.pem" still needs to change
}
