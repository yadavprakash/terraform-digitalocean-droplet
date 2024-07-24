variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to control the droplet creation."
}

variable "region" {
  type        = string
  default     = ""
  description = "The region where the Droplet will be created."
}

variable "backups" {
  type        = bool
  default     = false
  description = "Boolean controlling if backups are made. Defaults to false."
}

variable "block_storage_filesystem_label" {
  type        = string
  default     = "data"
  description = "Initial filesystem label for the block storage volume."
}

variable "block_storage_filesystem_type" {
  type        = string
  default     = null
  description = "Initial filesystem type (xfs or ext4) for the block storage volume."
}

variable "block_storage_size" {
  type        = number
  default     = 5
  description = "(Required) The size of the block storage volume in GiB. If updated, can only be expanded."
}

variable "droplet_count" {
  type        = number
  default     = 1
  description = "The number of droplets / other resources to create"
}

variable "droplet_size" {
  type        = string
  default     = ""
  description = "The unique slug that indentifies the type of Droplet."
}

variable "floating_ip" {
  type        = bool
  default     = false
  description = "Boolean to control whether floating IPs should be created."
}

variable "image_name" {
  type        = string
  default     = ""
  description = "The image name."
}

variable "ipv6" {
  type        = bool
  default     = false
  description = "Boolean controlling if IPv6 is enabled. Defaults to false."
}

variable "monitoring" {
  type        = bool
  default     = false
  description = "Boolean controlling whether monitoring agent is installed. Defaults to false."
}

variable "resize_disk" {
  type        = bool
  default     = true
  description = "Boolean controlling whether to increase the disk size when resizing a Droplet."
}

variable "user_data" {
  type        = string
  default     = null
  description = "A string of the desired User Data for the Droplet."
}

variable "vpc_uuid" {
  type        = string
  default     = ""
  description = "The ID of the VPC where the Droplet will be located."
}

variable "ssh_key" {
  type        = string
  default     = ""
  description = "A list of SSH key IDs or fingerprints to enable in the format [12345, 123456]."
}

variable "key_name" {
  type        = string
  default     = ""
  description = "name of key."
}

variable "key_path" {
  type        = string
  default     = ""
  description = "Name  (ssh-rsa AAAAB3NzaC1yc2AADAQABAzV0LX3X8BsXdMsQ`)."
}

variable "managedby" {
  type        = string
  default     = "yadavprakash"
  description = "ManagedBy, eg 'yadavprakash'"
}

variable "droplet_agent" {
  type        = bool
  default     = false
  description = "A boolean indicating whether to install the DigitalOcean agent used for providing access to the Droplet web console in the control panel."
}

variable "graceful_shutdown" {
  type        = bool
  default     = false
  description = "A boolean indicating whether the droplet should be gracefully shut down before it is deleted."
}

variable "enable_firewall" {
  type        = bool
  default     = true
  description = "Enable default Security Group with only Egress traffic allowed."
}

variable "inbound_rules" {
  type        = any
  default     = []
  description = "List of objects that represent the configuration of each inbound rule."
}
variable "outbound_rule" {
  type = list(object({
    protocol              = string
    port_range            = string
    destination_addresses = list(string)
  }))
  default = [
    {
      protocol   = "tcp"
      port_range = "1-65535"
      destination_addresses = [
        "0.0.0.0/0",
      "::/0"]
    },
    {
      protocol   = "udp"
      port_range = "1-65535"
      destination_addresses = [
        "0.0.0.0/0",
      "::/0"]
    }
  ]
  description = "List of objects that represent the configuration of each outbound rule."
}