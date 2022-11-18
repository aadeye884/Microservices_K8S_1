output "lb_cluster_Pub_IP" {
  value       = aws_instance.lb_cluster.public_ip
}

output "lb_cluster_Pri_IP" {
  value       = aws_instance.lb_cluster.private_ip
}