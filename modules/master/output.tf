output "Master_node_IP" {
  value       = aws_instance.UST1_Master_node.public_ip
  description = "Master public IP"
}