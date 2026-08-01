data "azurerm_subnet" "SNET" {
  for_each             = var.BASTION
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
}
