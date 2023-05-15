data "yandex_vpc_network" "network" {
  name = "mynet"
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    endpoint                = "storage.yandexcloud.net"
    bucket                  = var.network_bucket_name
    region                  = "ru-central1"
    key                     = var.network_state_key
    shared_credentials_file = "storage.key"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}