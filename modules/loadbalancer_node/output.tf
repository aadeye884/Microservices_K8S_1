output "loadbal_node_IP" {
  value       = aws_instance.loadbal_node.public_ip
}