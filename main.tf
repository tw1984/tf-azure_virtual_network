resource "azurerm_virtual_network" "vnet" {
  name                = local.virtualNetworkName
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space

  lifecycle {
    ignore_changes = [tags]
  }
}

locals {
  virtualNetworkName = var.vnetName != "" ? var.vnetName : "vnet-${var.vnet_type}-${var.location}-${replace(var.address_space[0], "/", "_")}"
}

resource "azurerm_virtual_network_dns_servers" "dnsservers" {
  count = var.use_custom_dns_servers ? 1 : 0

  virtual_network_id = azurerm_virtual_network.vnet.id
  dns_servers        = var.dns_servers
}