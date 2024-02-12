# Terraform Infrastructure as Code (IaC) - digitalocean droplet Module

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Authors](#authors)
- [License](#license)

## Introduction
This Terraform module creates structured droplet for digitalocean resources with specific attributes.

## Usage

- Use the module by referencing its source and providing the required variables.

```hcl
module "droplet" {
  source             = "git::https://github.com/opsstation/terraform-digitalocean-droplet.git?ref=v1.0.0"
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

```
Please ensure you specify the correct 'source' path for the module.

## Module Inputs

- `name`: The name of the application.
- `environment`: The environment (e.g., "test", "production").
- `label_order`: Label order, e.g. `name`,`application`.
- `enabled`: Flag to control the droplet creation.
- `managedby`:  ManagedBy, eg 'opsstation'.
- `floating_ip` : Boolean to control whether floating IPs should be created.

## Module Outputs
- This module currently does not provide any outputs.

# Examples
For detailed examples on how to use this module, please refer to the '[example](https://github.com/opsstation/terraform-digitalocean-droplet/tree/master/_example)' directory within this repository.

## Authors
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/opsstation/terraform-digitalocean-droplet/blob/master/LICENSE) file for details.



<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.6.6 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.31.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | >= 2.31.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git::https://github.com/opsstation/terraform-digitalocean-labels.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [digitalocean_droplet.test](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet) | resource |
| [digitalocean_firewall.default](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/firewall) | resource |
| [digitalocean_floating_ip.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/floating_ip) | resource |
| [digitalocean_floating_ip_assignment.foobar](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/floating_ip_assignment) | resource |
| [digitalocean_ssh_key.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/ssh_key) | resource |
| [digitalocean_volume.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/volume) | resource |
| [digitalocean_volume_attachment.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/volume_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backups"></a> [backups](#input\_backups) | Boolean controlling if backups are made. Defaults to false. | `bool` | `false` | no |
| <a name="input_block_storage_filesystem_label"></a> [block\_storage\_filesystem\_label](#input\_block\_storage\_filesystem\_label) | Initial filesystem label for the block storage volume. | `string` | `"data"` | no |
| <a name="input_block_storage_filesystem_type"></a> [block\_storage\_filesystem\_type](#input\_block\_storage\_filesystem\_type) | Initial filesystem type (xfs or ext4) for the block storage volume. | `string` | `null` | no |
| <a name="input_block_storage_size"></a> [block\_storage\_size](#input\_block\_storage\_size) | (Required) The size of the block storage volume in GiB. If updated, can only be expanded. | `number` | `5` | no |
| <a name="input_droplet_agent"></a> [droplet\_agent](#input\_droplet\_agent) | A boolean indicating whether to install the DigitalOcean agent used for providing access to the Droplet web console in the control panel. | `bool` | `false` | no |
| <a name="input_droplet_count"></a> [droplet\_count](#input\_droplet\_count) | The number of droplets / other resources to create | `number` | `1` | no |
| <a name="input_droplet_size"></a> [droplet\_size](#input\_droplet\_size) | The unique slug that indentifies the type of Droplet. | `string` | `""` | no |
| <a name="input_enable_firewall"></a> [enable\_firewall](#input\_enable\_firewall) | Enable default Security Group with only Egress traffic allowed. | `bool` | `true` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Flag to control the droplet creation. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_floating_ip"></a> [floating\_ip](#input\_floating\_ip) | Boolean to control whether floating IPs should be created. | `bool` | `false` | no |
| <a name="input_graceful_shutdown"></a> [graceful\_shutdown](#input\_graceful\_shutdown) | A boolean indicating whether the droplet should be gracefully shut down before it is deleted. | `bool` | `false` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | The image name. | `string` | `""` | no |
| <a name="input_inbound_rules"></a> [inbound\_rules](#input\_inbound\_rules) | List of objects that represent the configuration of each inbound rule. | `any` | `[]` | no |
| <a name="input_ipv6"></a> [ipv6](#input\_ipv6) | Boolean controlling if IPv6 is enabled. Defaults to false. | `bool` | `false` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | name of key. | `string` | `""` | no |
| <a name="input_key_path"></a> [key\_path](#input\_key\_path) | Name  (ssh-rsa AAAAB3NzaC1yc2AADAQABAzV0LX3X8BsXdMsQ`).` | `string` | `""` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'opsstation' | `string` | `"opsstation"` | no |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | Boolean controlling whether monitoring agent is installed. Defaults to false. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_outbound_rule"></a> [outbound\_rule](#input\_outbound\_rule) | List of objects that represent the configuration of each outbound rule. | <pre>list(object({<br>    protocol              = string<br>    port_range            = string<br>    destination_addresses = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "destination_addresses": [<br>      "0.0.0.0/0",<br>      "::/0"<br>    ],<br>    "port_range": "1-65535",<br>    "protocol": "tcp"<br>  },<br>  {<br>    "destination_addresses": [<br>      "0.0.0.0/0",<br>      "::/0"<br>    ],<br>    "port_range": "1-65535",<br>    "protocol": "udp"<br>  }<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the Droplet will be created. | `string` | `""` | no |
| <a name="input_resize_disk"></a> [resize\_disk](#input\_resize\_disk) | Boolean controlling whether to increase the disk size when resizing a Droplet. | `bool` | `true` | no |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | A list of SSH key IDs or fingerprints to enable in the format [12345, 123456]. | `string` | `""` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | A string of the desired User Data for the Droplet. | `string` | `null` | no |
| <a name="input_vpc_uuid"></a> [vpc\_uuid](#input\_vpc\_uuid) | The ID of the VPC where the Droplet will be located. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_disk"></a> [disk](#output\_disk) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_image"></a> [image](#output\_image) | n/a |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | n/a |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | n/a |
| <a name="output_ipv4_address_private"></a> [ipv4\_address\_private](#output\_ipv4\_address\_private) | n/a |
| <a name="output_ipv6"></a> [ipv6](#output\_ipv6) | n/a |
| <a name="output_locked"></a> [locked](#output\_locked) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_price_hourly"></a> [price\_hourly](#output\_price\_hourly) | n/a |
| <a name="output_price_monthly"></a> [price\_monthly](#output\_price\_monthly) | n/a |
| <a name="output_private_networking"></a> [private\_networking](#output\_private\_networking) | n/a |
| <a name="output_region"></a> [region](#output\_region) | n/a |
| <a name="output_size"></a> [size](#output\_size) | n/a |
| <a name="output_status"></a> [status](#output\_status) | n/a |
| <a name="output_urn"></a> [urn](#output\_urn) | n/a |
| <a name="output_vcpus"></a> [vcpus](#output\_vcpus) | n/a |
| <a name="output_volume_ids"></a> [volume\_ids](#output\_volume\_ids) | n/a |
<!-- END_TF_DOCS -->