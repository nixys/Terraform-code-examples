#=========== main ==============
variable "cloud_id" {
  description = "The cloud ID"
  type        = string
}
variable "folder_id" {
  description = "The folder ID"
  type        = string
}
variable "default_zone" {
  description = "The default zone"
  type        = string
  default     = "ru-cenral1-a"
}

#=========== network ==============
variable "network_name" {
  description = "The name of main network"
  type        = string
}

#=========== subnet ==============
variable "subnets" {
  description = "Subnets for k8s"

  type = map(list(object(
    {
      name = string,
      zone = string,
      cidr = list(string)
    }))
  )

  validation {
    condition     = alltrue([for i in keys(var.subnets) : alltrue([for j in lookup(var.subnets, i) : contains(["ru-central1-a", "ru-central1-b", "ru-central1-c"], j.zone)])])
    error_message = "Error! Zones not supported!"
  }
}

#=========== security_group ==============
variable "white_ips_for_master" {
  type = list(string)
}

#=========== external_ip ==============
variable "external_static_ips" {
  description = "static ips"

  type = map(list(object(
    {
      name = string,
      zone = string
    }))
  )
}