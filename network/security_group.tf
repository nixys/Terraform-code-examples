resource "yandex_vpc_security_group" "internal" {
  name        = "internal"
  description = "Managed by terraform"
  network_id  = yandex_vpc_network.mynet.id
  labels = {
    firewall = "yc_internal"
  }
  ingress {
    protocol          = "ANY"
    description       = "self"
    predefined_target = "self_security_group"
    from_port         = 0
    to_port           = 65535
  }
  ingress {
    protocol       = "ANY"
    description    = "Правило разрешает взаимодействие под-под и сервис-сервис. Укажите подсети вашего кластера и сервисов. P.s. Правило избыточно и добавлено только потому, что политика self_security_group не функционирует как положено между машинами в разных регионах."
    v4_cidr_blocks = flatten([for v in concat(var.subnets["k8s_masters"], var.subnets["k8s_workers"]) : v.cidr])
    from_port      = 0
    to_port        = 65535
  }

  egress {
    protocol          = "ANY"
    description       = "self"
    predefined_target = "self_security_group"
    from_port         = 0
    to_port           = 65535
  }
}

resource "yandex_vpc_security_group" "k8s_master" {
  name        = "k8s-master"
  description = "Managed by terraform"
  network_id  = yandex_vpc_network.mynet.id
  labels = {
    firewall = "k8s-master"
  }
  ingress {
    protocol       = "TCP"
    description    = "access to api k8s"
    v4_cidr_blocks = var.white_ips_for_master
    port           = 443
  }
  ingress {
    protocol          = "TCP"
    description       = "access to api k8s from Yandex lb"
    predefined_target = "loadbalancer_healthchecks"
    from_port         = 0
    to_port           = 65535
  }
}

resource "yandex_vpc_security_group" "k8s_worker" {
  name        = "k8s-worker"
  description = "Managed by terraform"
  network_id  = yandex_vpc_network.mynet.id
  labels = {
    firewall = "k8s-worker"
  }
  ingress {
    protocol       = "ANY"
    description    = "any connections"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
  egress {
    protocol       = "ANY"
    description    = "any connections"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}
