provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "gitlab-ci" {

  zone  = var.zone_instance
  name  = "gitlab-ci-vm"

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 20
  }

  #scheduling_policy {
  #  preemptible = true
  #}

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 50
      type = "network-hdd"
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
}
