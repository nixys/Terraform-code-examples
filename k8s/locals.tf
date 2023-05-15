locals {
  network_output = data.terraform_remote_state.network.outputs
  worker_subnet_list = zipmap([for subnet in local.network_output.k8s_workers_subnet_info : subnet.zone], [for subnet in local.network_output.k8s_workers_subnet_info : subnet.subnet_id])
}