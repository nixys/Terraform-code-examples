output "test" {
  value = local.worker_subnet_list
}

output "test2" {
  value = local.network_output.k8s_workers_subnet_info
}