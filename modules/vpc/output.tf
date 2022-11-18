output "vpc-id" {
  description = "vpc ID"
  value       = aws_vpc.VPC.id
}
output "subnet-id1" {
  description = "Public Subnets ID 1"
  value       = aws_subnet.PUB_SN1.id
}
output "subnet-id2" {
  description = "Public Subnets ID 2"
  value       = aws_subnet.PUB_SN2.id
}
output "subnet-id3" {
  description = "Public Subnets ID 3"
  value       = aws_subnet.PUB_SN3.id
}
