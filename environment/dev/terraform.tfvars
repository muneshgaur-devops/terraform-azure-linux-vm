RGS = {
  RG1 = {
    rg_name  = "RG-Munesh-dev"
    location = "Westus2"
  }
  RG2 = {
    rg_name  = "RG-Tinku-dev"
    location = "Westus2"
  }
  RG3 = {
    rg_name  = "RG-Pinku-dev"
    location = "Westus2"
  }
}
STG = {
  STG1 = {
    storage_account_name = "muneshstgdev0123"
    rg_name              = "RG-Munesh-dev"
    location             = "westus2"
    account_tier         = "Standard"
    art                  = "LRS"
  }
}
SCON = {
  SCON1 = {
    container_name        = "personal"
    container_access_type = "private"
    storage_account_name  = "muneshstgdev0123"
    rg_name               = "RG-Munesh-dev"
  }
}
VNET = {
  VNET1 = {
    Vnet_name     = "Vnet-Munesh-dev"
    rg_name       = "RG-Munesh-dev"
    location      = "westus2"
    address_space = ["10.0.0.0/16"]
  }
}
SNET = {
  SNET1 = {
    subnet_name      = "frontend-subnet-dev"
    rg_name          = "RG-Munesh-dev"
    Vnet_name        = "Vnet-Munesh-dev"
    address_prefixes = ["10.0.1.0/24"]
  }
  SNET2 = {
    subnet_name      = "backend-subnet-dev"
    rg_name          = "RG-Munesh-dev"
    Vnet_name        = "Vnet-Munesh-dev"
    address_prefixes = ["10.0.2.0/24"]
  }
  SNET3 = {
    subnet_name      = "AzureBastionSubnet"
    rg_name          = "RG-Munesh-dev"
    Vnet_name        = "Vnet-Munesh-dev"
    address_prefixes = ["10.0.3.0/26"]
  }
}
BASTION = {
  BASTION1 = {
    bastion_name   = "bastion-dev"
    rg_name        = "RG-Munesh-dev"
    location       = "westus2"
    ip_config_name = "bastion-ip-config"
    public_ip_name = "bastion-pip-dev"
    subnet_name    = "AzureBastionSubnet"
    vnet_name      = "Vnet-Munesh-dev"
  }
}
VM = {
  VM1 = {
    nic_name              = "nic-frontend-dev"
    rg_name               = "RG-Munesh-dev"
    location              = "westus2"
    nic_ip_name           = "nic_ip_frontend-dev"
    private_ip_allocation = "Dynamic"
    vm_name               = "frontend-vm-dev"
    size                  = "Standard_DC1s_v3"
    admin_username        = "muneshadmin"
    admin_password        = "Devops@1234"
    subnet_name           = "frontend-subnet-dev"
    vnet_name             = "Vnet-Munesh-dev"
  }
  VM2 = {
    nic_name              = "nic-backend-dev"
    rg_name               = "RG-Munesh-dev"
    location              = "westus2"
    nic_ip_name           = "nic_ip_backend-dev"
    private_ip_allocation = "Dynamic"
    vm_name               = "backend-vm-dev"
    size                  = "Standard_DC1s_v3"
    admin_username        = "muneshadmin"
    admin_password        = "Devops@1234"
    subnet_name           = "backend-subnet-dev"
    vnet_name             = "Vnet-Munesh-dev"
  }
  VM3 = {
    nic_name              = "nic-database-dev"
    rg_name               = "RG-Munesh-dev"
    location              = "westus2"
    nic_ip_name           = "nic_ip_database-dev"
    private_ip_allocation = "Dynamic"
    vm_name               = "database-vm-dev"
    size                  = "Standard_DC1s_v3"
    admin_username        = "muneshadmin"
    admin_password        = "Devops@1234"
    subnet_name           = "backend-subnet-dev"
    vnet_name             = "Vnet-Munesh-dev"
  }
  VM4 = {
    nic_name              = "nic-monitoring-dev"
    rg_name               = "RG-Munesh-dev"
    location              = "westus2"
    nic_ip_name           = "nic_ip_monitoring-dev"
    private_ip_allocation = "Dynamic"
    vm_name               = "monitoring-vm-dev"
    size                  = "Standard_DC1s_v3"
    admin_username        = "muneshadmin"
    admin_password        = "Devops@1234"
    subnet_name           = "frontend-subnet-dev"
    vnet_name             = "Vnet-Munesh-dev"
  }
}
LB = {
  LB1 = {
    lb_name           = "frontend-lb-dev"
    rg_name           = "RG-Munesh-dev"
    location          = "westus2"
    frontend_ip_name  = "frontend-lb-ip"
    public_ip_name    = "frontend-lb-pip-dev"
    backend_pool_name = "frontend-backend-pool"
  }
  LB2 = {
    lb_name           = "backend-lb-dev"
    rg_name           = "RG-Munesh-dev"
    location          = "westus2"
    frontend_ip_name  = "backend-lb-ip"
    public_ip_name    = "backend-lb-pip-dev"
    backend_pool_name = "backend-backend-pool"
  }
}
LB_VM_ASSOC = {
  ASSOC1 = {
    lb_key      = "LB1"
    nic_name    = "nic-frontend-dev"
    nic_ip_name = "nic_ip_frontend-dev"
    rg_name     = "RG-Munesh-dev"
  }
  ASSOC2 = {
    lb_key      = "LB1"
    nic_name    = "nic-monitoring-dev"
    nic_ip_name = "nic_ip_monitoring-dev"
    rg_name     = "RG-Munesh-dev"
  }
  ASSOC3 = {
    lb_key      = "LB2"
    nic_name    = "nic-backend-dev"
    nic_ip_name = "nic_ip_backend-dev"
    rg_name     = "RG-Munesh-dev"
  }
  ASSOC4 = {
    lb_key      = "LB2"
    nic_name    = "nic-database-dev"
    nic_ip_name = "nic_ip_database-dev"
    rg_name     = "RG-Munesh-dev"
  }
}
