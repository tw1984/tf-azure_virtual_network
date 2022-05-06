### Virtual Network Resource ###
resource "azurerm_virtual_network" "vnet" {
  name                = local.virtualNetworkName
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space

  lifecycle {
    ignore_changes = [tags]
  }
}

### Virtual Network DNS Servers ###
resource "azurerm_virtual_network_dns_servers" "dnsservers" {
  count = var.use_custom_dns_servers ? 1 : 0

  virtual_network_id = azurerm_virtual_network.vnet.id
  dns_servers        = var.dns_servers
}


### Virtual Network Subnets ###
resource "azurerm_subnet" "subnets" {
  for_each = local.subnets

  name                                          = each.value["name"] != "" ? each.value["name"] : "snet-${var.vnet_type}-${var.location}-${replace(each.value["address_prefixes"][0], "/", "_")}"
  address_prefixes                              = each.value["address_prefixes"]
  enforce_private_link_service_network_policies = each.value["private_endpoint_support"]
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = azurerm_virtual_network.vnet.name
}

### LOCALS ###
locals {
  subnets            = var.create_subnets ? var.subnets : null
  virtualNetworkName = var.vnetName != "" ? var.vnetName : "vnet-${var.vnet_type}-${var.location}-${replace(var.address_space[0], "/", "_")}"
}
