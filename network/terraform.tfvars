#=========== main ==============
cloud_id  = "$YOUR_VARIABLE"
folder_id = "$YOUR_VARIABLE"

#=========== network ==============
network_name = "mynet"

#=========== subnet ==============
subnets = {
  "k8s_masters" = [
    {
      name = "k8s_master_zone_a"
      zone = "ru-central1-a"
      cidr = ["10.0.1.0/28"]
    },
    {
      name = "k8s_master_zone_b"
      zone = "ru-central1-b"
      cidr = ["10.0.2.0/28"]
    },
    {
      name = "k8s_master_zone_c"
      zone = "ru-central1-c"
      cidr = ["10.0.3.0/28"]
    }
  ],
  "k8s_workers" = [
    {
      name = "k8s_worker_zone_a"
      zone = "ru-central1-a"
      cidr = ["10.0.4.0/28"]
    },
    {
      name = "k8s_worker_zone_b"
      zone = "ru-central1-b"
      cidr = ["10.0.5.0/28"]
    },
    {
      name = "k8s_worker_zone_c"
      zone = "ru-central1-c"
      cidr = ["10.0.6.0/28"]
    }
  ],
}

#=========== security_group ==============
white_ips_for_master = ["0.0.0.0/0"]

#=========== external_ip ==============
external_static_ips = {
  ingress_lb = [
    {
      name = "ingress_lb_zone_ru_central1_a"
      zone = "ru-central1-a"
    }
  ]
}