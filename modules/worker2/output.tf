output "Worker2_node_IP" {
  value       = aws_instance.Worker2_node.public_ip
}

output "Worker2_node_ID" {
  value       = aws_instance.Worker2_node.id
  description = "Worker2 node ID"
}