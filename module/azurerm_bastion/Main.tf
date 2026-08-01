resource "azurerm_public_ip" "bastion_pip" {
  for_each            = var.BASTION
  name                = each.value.public_ip_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  for_each            = var.BASTION
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                 = each.value.ip_config_name
    subnet_id            = data.azurerm_subnet.SNET[each.key].id
    public_ip_address_id = azurerm_public_ip.bastion_pip[each.key].id
  }
}
