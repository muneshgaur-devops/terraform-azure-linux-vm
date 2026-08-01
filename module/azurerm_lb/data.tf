data "azurerm_network_interface" "nic" {
  for_each            = var.LB_VM_ASSOC
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}
