output "Worker01_node_IP" {
  value       = aws_instance.Worker1_node.public_ip
  description = "Worker1 public IP"
}