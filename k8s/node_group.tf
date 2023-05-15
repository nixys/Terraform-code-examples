resource "yandex_kubernetes_node_group" "my_node_groups" {
  for_each    = var.node_groups
  cluster_id  = yandex_kubernetes_cluster.k8s-regional.id
  name        = each.key
  description = lookup(each.value, "description", null)
  version     = lookup(each.value, "version", var.master_version)
  labels = lookup(each.value, "labels", null)
  instance_template {
    platform_id = lookup(each.value, "platform_id", null)
    name        = lookup(each.value, "name", null)
    network_interface {
      nat                = lookup(each.value, "nat", true)
      subnet_ids         = [lookup(local.worker_subnet_list, each.value["zone"])]
      security_group_ids = [local.network_output.sg_internal, local.network_output.sg_k8s_worker]
    }
    resources {
      memory = lookup(each.value, "memory", 2)
      cores  = lookup(each.value, "cores", 2)
    }
    boot_disk {
      type = lookup(each.value, "boot_disk_type", "network-hdd")
      size = lookup(each.value, "boot_disk_size", 64)
    }
    scheduling_policy {
      preemptible = lookup(each.value, "preemptible", false)
    }
  }
  scale_policy {
    dynamic "fixed_scale" {
      for_each = flatten([lookup(each.value, "fixed_scale", can(each.value["auto_scale"]) ? [] : [{ size = 1 }])])

      content {
        size = fixed_scale.value.size
      }
    }
    dynamic "auto_scale" {
      for_each = flatten([lookup(each.value, "auto_scale", [])])
      content {
        min     = auto_scale.value.min
        max     = auto_scale.value.max
        initial = auto_scale.value.initial
      }
    }
  }
  allocation_policy {
    location {
      zone = each.value["zone"]
    }
  }
}