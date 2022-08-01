output "Ansible_IP" {
  value       = aws_instance.Ansible_node.public_ip
  description = "Ansible public IP"
}