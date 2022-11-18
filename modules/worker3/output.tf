output "Worker3_node_IP" {
  value       = aws_instance.Worker3_node.public_ip
}

output "Worker3_node_ID" {
  value       = aws_instance.Worker3_node.id
  description = "Worker3 node ID"
}