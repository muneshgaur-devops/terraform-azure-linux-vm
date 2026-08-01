RGS = {
  RG1 = {
    rg_name  = "RG-Munesh-prod"
    location = "Westus2"
  }
}
STG = {
  STG1 = {
    storage_account_name = "muneshstgprod0123"
    rg_name              = "RG-Munesh-prod"
    location             = "westus2"
    account_tier         = "Standard"
    art                  = "LRS"
  }
}
SCON = {
  SCON1 = {
    container_name        = "personal"
    container_access_type = "private"
    storage_account_name  = "muneshstgprod0123"
    rg_name               = "RG-Munesh-prod"
  }
}
VNET = {
  VNET1 = {
    Vnet_name     = "Vnet-Munesh-prod"
    rg_name       = "RG-Munesh-prod"
    location      = "westus2"
    address_space = ["10.0.0.0/16"]
  }
}
SNET = {
  SNET1 = {
    subnet_name      = "frontend-subnet-prod"
    rg_name          = "RG-Munesh-prod"
    Vnet_name        = "Vnet-Munesh-prod"
    address_prefixes = ["10.0.1.0/24"]
  }
  SNET2 = {
    subnet_name      = "backend-subnet-prod"
    rg_name          = "RG-Munesh-prod"
    Vnet_name        = "Vnet-Munesh-prod"
    address_prefixes = ["10.0.2.0/24"]
  }
  SNET3 = {
    subnet_name      = "AzureBastionSubnet"
    rg_name          = "RG-Munesh-prod"
    Vnet_name        = "Vnet-Munesh-prod"
    address_prefixes = ["10.0.3.0/26"]
  }
}
BASTION = {
  BASTION1 = {
    bastion_name   = "bastion-prod"
    rg_name        = "RG-Munesh-prod"
    location       = "westus2"
    ip_config_name = "bastion-ip-config"
    public_ip_name = "bastion-pip-prod"
    subnet_name    = "AzureBastionSubnet"
    vnet_name      = "Vnet-Munesh-prod"
  }
}
VM = {
  VM1 = {
    nic_name              = "nic-frontend-prod"
    rg_name               = "RG-Munesh-prod"
    location              = "westus2"
    nic_ip_name           = "nic_ip_frontend-prod"
    private_ip_allocation = "Dynamic"
    vm_name               = "frontend-vm-prod"
    size                  = "Standard_DC1s_v3"
    admin_username        = "muneshadmin"
    admin_password        = "Devops@1234"
    subnet_name           = "frontend-subnet-prod"
    vnet_name             = "Vnet-Munesh-prod"
  }
  VM2 = {
    nic_name              = "nic-backend-prod"
    rg_name               = "RG-Munesh-prod"
    location              = "westus2"
    nic_ip_name           = "nic_ip_backend-prod"
    private_ip_allocation = "Dynamic"
    vm_name               = "backend-vm-prod"
    size                  = "Standard_DC1s_v3"
    admin_username        = "muneshadmin"
    admin_password        = "Devops@1234"
    subnet_name           = "backend-subnet-prod"
    vnet_name             = "Vnet-Munesh-prod"
  }
  VM3 = {
    nic_name              = "nic-database-prod"
    rg_name               = "RG-Munesh-prod"
    location              = "westus2"
    nic_ip_name           = "nic_ip_database-prod"
    private_ip_allocation = "Dynamic"
    vm_name               = "database-vm-prod"
    size                  = "Standard_DC1s_v3"
    admin_username        = "muneshadmin"
    admin_password        = "Devops@1234"
    subnet_name           = "backend-subnet-prod"
    vnet_name             = "Vnet-Munesh-prod"
  }
  VM4 = {
    nic_name              = "nic-monitoring-prod"
    rg_name               = "RG-Munesh-prod"
    location              = "westus2"
    nic_ip_name           = "nic_ip_monitoring-prod"
    private_ip_allocation = "Dynamic"
    vm_name               = "monitoring-vm-prod"
    size                  = "Standard_DC1s_v3"
    admin_username        = "muneshadmin"
    admin_password        = "Devops@1234"
    subnet_name           = "frontend-subnet-prod"
    vnet_name             = "Vnet-Munesh-prod"
  }
}
LB = {
  LB1 = {
    lb_name           = "frontend-lb-prod"
    rg_name           = "RG-Munesh-prod"
    location          = "westus2"
    frontend_ip_name  = "frontend-lb-ip"
    public_ip_name    = "frontend-lb-pip-prod"
    backend_pool_name = "frontend-backend-pool"
  }
  LB2 = {
    lb_name           = "backend-lb-prod"
    rg_name           = "RG-Munesh-prod"
    location          = "westus2"
    frontend_ip_name  = "backend-lb-ip"
    public_ip_name    = "backend-lb-pip-prod"
    backend_pool_name = "backend-backend-pool"
  }
}
LB_VM_ASSOC = {
  ASSOC1 = {
    lb_key      = "LB1"
    nic_name    = "nic-frontend-prod"
    nic_ip_name = "nic_ip_frontend-prod"
    rg_name     = "RG-Munesh-prod"
  }
  ASSOC2 = {
    lb_key      = "LB1"
    nic_name    = "nic-monitoring-prod"
    nic_ip_name = "nic_ip_monitoring-prod"
    rg_name     = "RG-Munesh-prod"
  }
  ASSOC3 = {
    lb_key      = "LB2"
    nic_name    = "nic-backend-prod"
    nic_ip_name = "nic_ip_backend-prod"
    rg_name     = "RG-Munesh-prod"
  }
  ASSOC4 = {
    lb_key      = "LB2"
    nic_name    = "nic-database-prod"
    nic_ip_name = "nic_ip_database-prod"
    rg_name     = "RG-Munesh-prod"
  }
}
