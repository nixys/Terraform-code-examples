#=========== main ==============
cloud_id  = "$YOUR_VARIABLE"
folder_id = "$YOUR_VARIABLE"

#=========== terraform_remote_state ==============
network_state_key = "my-project-network.tfstate"
network_bucket_name = "$YOUR_VARIABLE"

#=========== service_account ==============
service_account_name  = "myaccount"
kms_provider_key_name = "kms-key"

#=========== cluster ==============
cluster_name   = "cluster"
master_version = "1.22"
master_region  = "ru-central1"

#=========== node_groups ==============
node_groups = {
  node-group-a = {
    platform_id    = "standard-v1",
    name           = "worker-a-{instance.short_id}",
    cores          = 2,
    memory         = 2,
    boot_disk_type = "network-ssd",
    boot_disk_size = 32,
    zone           = "ru-central1-a",
    auto_scale = {
      min     = 1,
      max     = 3,
      initial = 1
    }
  }
  node-group-b = {
    platform_id    = "standard-v1",
    name           = "worker-b-{instance.short_id}",
    cores          = 2,
    memory         = 2,
    boot_disk_type = "network-ssd",
    boot_disk_size = 32,
    zone           = "ru-central1-b",
    fixed_scale = {
      size     = 1
    }
  }
  node-group-c = {
    platform_id    = "standard-v1",
    name           = "worker-c-{instance.short_id}",
    cores          = 2,
    memory         = 2,
    boot_disk_type = "network-ssd",
    boot_disk_size = 32,
    zone           = "ru-central1-c",
    fixed_scale = {
      size     = 1
    }
  }
}