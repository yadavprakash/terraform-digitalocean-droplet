output "id" {
  value = digitalocean_droplet.test[*].id
}

output "urn" {
  value = join("", digitalocean_droplet.test[*].urn)
}

output "name" {
  value = join("", digitalocean_droplet.test[*].name)
}

output "region" {
  value = join("", digitalocean_droplet.test[*].region)
}

output "image" {
  value = join("", digitalocean_droplet.test[*].image)
}

output "ipv6" {
  value = join("", digitalocean_droplet.test[*].ipv6)
}

output "ipv4_address" {
  value = join("", digitalocean_droplet.test[*].ipv4_address)
}

output "ipv4_address_private" {
  value = join("", digitalocean_droplet.test[*].ipv4_address_private)
}

output "locked" {
  value = join("", digitalocean_droplet.test[*].locked)
}

output "private_networking" {
  value = join("", digitalocean_droplet.test[*].private_networking)
}

output "price_hourly" {
  value = join("", digitalocean_droplet.test[*].price_hourly)
}

output "price_monthly" {
  value = join("", digitalocean_droplet.test[*].price_monthly)
}

output "size" {
  value = join("", digitalocean_droplet.test[*].size)
}

output "disk" {
  value = join("", digitalocean_droplet.test[*].disk)
}

output "vcpus" {
  value = join("", digitalocean_droplet.test[*].vcpus)
}

output "status" {
  value = join("", digitalocean_droplet.test[*].status)
}

output "volume_ids" {
  value = digitalocean_droplet.test[*].volume_ids
}

output "ip_address" {
  value = join("", digitalocean_floating_ip_assignment.foobar[*].ip_address)
}
