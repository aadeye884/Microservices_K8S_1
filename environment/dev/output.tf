output "ansible_ip" {
  value = module.dev_ansible.Ansible_IP
}
output "master1_ip" {
  value = module.dev_master1-node.Master1_node_IP
}
output "master2_ip" {
  value = module.dev_master2-node.Master2_node_IP
}
output "master3_ip" {
  value = module.dev_master3-node.Master3_node_IP
}
output "worker1_ip" {
  value = module.dev_worker1-node.Worker1_node_IP
}
output "worker2_ip" {
  value = module.dev_worker2-node.Worker2_node_IP
}
output "worker3_ip" {
  value = module.dev_worker3-node.Worker3_node_IP
}
output "lb-dns" {
  value = module.dev_loadbalancer.Load_Balancer_dns
}
# output "route53-nameserver" {
#   value = module.dev_route53.Route53_nameservers
# }
output "cluster-lb-pub-ip" {
  value = module.dev_lb_cluster.lb_cluster_Pub_IP
}
output "cluster-lb-pri-ip" {
  value = module.dev_lb_cluster.lb_cluster_Pri_IP
}