output "Route53_nameservers" {
  value = aws_route53_record.UST1_cluster.name
}

output "ns_records" {
  value = aws_route53_zone.UST1_zone.name_servers
}