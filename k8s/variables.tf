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

#=========== terraform_remote_state ==============
variable "network_state_key" {
  description = "The key of state for the network."
  type        = string
  default     = null
}

variable "network_bucket_name" {
  description = "The name of bucket for the network."
  type        = string
  default     = null
}

#=========== service_account ==============
variable "service_account_name" {
  description = "Name of service account"
  type = string
  default = null
}

variable "kms_provider_key_name" {
  description = "KMS key name."
  type = string
  default = null
}

#=========== cluster ==============
variable "cluster_name" {
  description = "Name of a specific Kubernetes cluster."
  type        = string
  default     = null
}

variable "network_policy_provider" {
  description = "Network policy provider for the cluster. Possible values: CALICO."
  type = string
  default = "CALICO"
}

variable "master_version" {
  description = "Version of Kubernetes that will be used for master."
  type = string
  default = null
}

variable "master_public_ip" {
  description = "Boolean flag. When true, Kubernetes master will have a visible ipv4 address."
  type = bool
  default = true
}

variable "master_region" {
  description = "Name of region where cluster will be created. Required for regional cluster, not used for zonal cluster."
  type = string
  default = null
}

#=========== node_groups ==============
variable "node_groups" {
  description = "Parameters of Kubernetes node groups."
  default = {}
}