resource "azurerm_virtual_network" "Vnet" {
  for_each            = var.VNET
  name                = each.value.Vnet_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  address_space       = each.value.address_space
}