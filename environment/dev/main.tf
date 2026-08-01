module "resource_group" {
  source = "../../module/azurerm_resource_group"
  RGS    = var.RGS
}
module "storage_account" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_storage_account"
  STG        = var.STG
}
module "storage_container" {
  depends_on = [module.storage_account]
  source     = "../../module/azurerm_storage_container"
  SCON       = var.SCON
}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_virtual_network"
  VNET       = var.VNET
}
module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../module/azurerm_subnet"
  SNET       = var.SNET
}
module "bastion" {
  depends_on = [module.subnet]
  source     = "../../module/azurerm_bastion"
  BASTION    = var.BASTION
}
module "virtual_machine" {
  depends_on = [module.subnet]
  source     = "../../module/azurerm_virtual_machine"
  VM         = var.VM
}
module "load_balancer" {
  depends_on  = [module.virtual_machine]
  source      = "../../module/azurerm_lb"
  LB          = var.LB
  LB_VM_ASSOC = var.LB_VM_ASSOC
}