resource "azurerm_storage_container" "SCON" {
  for_each              = var.SCON
  name                  = each.value.container_name
  storage_account_id    = data.azurerm_storage_account.STG[each.key].id
  container_access_type = each.value.container_access_type
}