# Azure Virtual Network Terraform Module

This is a Terraform module which will create virtual network resources, and select supporting services, in Azure.

Currently, this supports virtual network creation with the ability to dynamically enable custom dns servers.

# Development Notes
This is a basic module which will expand over time, primarily developed for some lab use cases. Terratest will be integrated (hopefully) soon.

# Usage
```hcl
module "hub-vnet" {
  source = "https://git@github.com/tw1984/tf-azure_virtual_network.git?ref=vX.X""
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_type           = "hub" //hub or spoke
  address_space       = var.hubVnetCidr

  //options
  use_custom_dns_servers = false
  dns_servers            = var.dns_servers
}
```