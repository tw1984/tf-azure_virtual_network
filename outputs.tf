output "Id" {
    description = "The virtual network id of the resource"
    value = azurerm_virtual_network.vnet.id
}

output "name" {
    description = "The virtual network name of the resource"
    value = azurerm_virtual_network.vnet.name
}

output "address_space" {
    description = "The virtual network address space."
    value = azurerm_virtual_network.vnet.address_space
}

output "dns_servers" {
    description = "The dns server(s) configured on the virtual network."
    value = azurerm_virtual_network.vnet.dns_servers
}