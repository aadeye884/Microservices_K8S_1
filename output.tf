output "master_host" {
  value       = aws_instance.master_host.public_ip
  description = "Master public IP"
}
output "Worker01_Host" {
  value       = aws_instance.worker1_host.public_ip
  description = "Worker1 public IP"
}
output "Worker02_Host" {
  value       = aws_instance.worker2_host.public_ip
  description = "Worker2 public IP"
}
output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "VPC ID"
}
output "subnet_id" {
  value       = aws_subnet.public_subnet1.id
  description = "Public Subnets ID 1"
}
output "subnet_id2" {
  value       = aws_subnet.public_subnet2.id
  description = "Public Subnets ID 2"
}
output "master_host_sg" {
  value       = aws_security_group.master_host_sg.id
  description = "Master Security Group ID"
}

output "key_name" {
  value = aws_key_pair.sock_key.key_name
}