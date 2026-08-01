resource "azurerm_public_ip" "pip" {
  for_each            = { for k, v in var.LB : k => v if lookup(v, "public_ip_name", null) != null }
  name                = each.value.public_ip_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "lb" {
  for_each            = var.LB
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_name
    public_ip_address_id = lookup(each.value, "public_ip_name", null) != null ? azurerm_public_ip.pip[each.key].id : null
  }
}

resource "azurerm_lb_backend_address_pool" "bap" {
  for_each        = var.LB
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.backend_pool_name
}

resource "azurerm_network_interface_backend_address_pool_association" "assoc" {
  for_each                = var.LB_VM_ASSOC
  network_interface_id    = data.azurerm_network_interface.nic[each.key].id
  ip_configuration_name   = each.value.nic_ip_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.bap[each.value.lb_key].id
}
