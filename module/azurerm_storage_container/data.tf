data "azurerm_storage_account" "STG" {
  for_each            = var.SCON
  name                = each.value.storage_account_name
  resource_group_name = each.value.rg_name
}