provider "digitalocean" {

}
##-----------------------------------------------------------------------
## VPC module call
##-----------------------------------------------------------------------

module "vpc" {
  source      = "git::https://github.com/opsstation/terraform-digitalocean-vpc.git?ref=v1.0.0"
  name        = "networking"
  environment = "test"
  label_order = ["name", "environment"]
  region      = "blr1"
  ip_range    = "10.21.0.0/24"

}

##-----------------------------------------------------------------------
## droplet module call
##-----------------------------------------------------------------------

#tfsec:ignore:digitalocean-compute-no-public-ingress
module "droplet" {
  source             = "./../"
  name               = "demo"
  environment        = "test"
  region             = "blr1"
  image_name         = "ubuntu-22-04-x64"
  ipv6               = false
  backups            = false
  monitoring         = false
  droplet_size       = "s-1vcpu-1gb"
  droplet_count      = 1
  block_storage_size = 5
  vpc_uuid           = module.vpc.id
  ssh_key            = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAA"
  user_data          = file("user-data.sh")
  inbound_rules = [
    {
      allowed_ip    = ["0.0.0.0/0"]
      allowed_ports = "22"
    },
    {
      allowed_ip    = ["0.0.0.0/0"]
      allowed_ports = "80"
    }
  ]
}
