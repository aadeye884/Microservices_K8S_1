output "Worker2_node_IP" {
  value       = aws_instance.Worker2_node.public_ip
  description = "Worker2 public IP"
}