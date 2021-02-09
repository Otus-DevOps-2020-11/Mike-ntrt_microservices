variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  default     = "ru-central1-a"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "key.json"
}
variable zone_instance {
  description = "Instance Zone"
  default     = "ru-central1-a"
}
variable instance_count {
  description = "Number of instances"
  type        = number
  default     = 2
}
variable image_id {
  description = "Disk image for reddit app"
}

