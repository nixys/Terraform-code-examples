locals {
  subnet_array = flatten([for k, v in var.subnets : [for j in v : {
    name = j.name
    zone = j.zone
    cidr = j.cidr
    }
  ]])

  external_ips_array = flatten([for k, v in var.external_static_ips : [for j in v : {
    name = j.name
    zone = j.zone
    }
  ]])
}