rgtest = {
    rg1 ={
        name= "rgtest1"
        location = "centralindia"
    }

    # rg2 ={
    #     name= "rgtest2"
    #     location = "centralus"
    # }
}

vnettest = {
    vnet1 = {
  name                = "vnetdevops-1"
  location            = "centralus"
  resource_group_name = "rgtest1"
  address_space       =  ["10.0.0.0/16"]
    }
#   vnet2 = {
#   name                = "vnetdevops-2"
#   location            = "centralus"
#   resource_group_name = "rgtest1"
#   address_space       =  ["10.1.0.0/16"]
#     }
}

 subnets= {
    subnet1 = {
        name                 = "frontend-subnet"
  resource_group_name  = "rgtest1"
  virtual_network_name = "vnetdevops-1"
  address_prefixes     = ["10.0.1.0/24"]
    }
subnet2 = {
        name                 = "backend-subnet"
  resource_group_name  = "rgtest1"
  virtual_network_name = "vnetdevops-1"
  address_prefixes     = ["10.0.2.0/24"]
    }

 } 
 
 pips= {
    pip1= {
  name                = "frontend-pip"
  resource_group_name = "rgtest1"
  location            = "centralus"
  allocation_method   = "Static"
 
}
pip2= {
  name                = "backend-pip"
  resource_group_name = "rgtest1"
  location            = "centralus"
  allocation_method   = "Static"
 
}
}

nics= {
  nic1 = {
    nic_name              = "frontend-nic"
    location          = "centralus"
    resource_group_name = "rgtest1"
    nic_vnet_name =      "vnetdevops-1"
    nic_subnet_name    = "frontend-subnet"
    nic_pip_name       = "frontend-pip"
    allocation_method = "Dynamic"
  }

  nic1 = {
    nic_name              = "backend-nic"
    location          = "centralus"
    resource_group_name = "rgtest1"
    nic_vnet_name =      "vnetdevops-1"
    nic_subnet_name    = "backend-subnet"
    nic_pip_name       = "backend-pip"
    allocation_method = "Dynamic"
  }
  }



nsgs = {
  nsg1 = {
    name = "frontendnsg"
    location = "centralus"
    resource_group_name = "rgtest1"
    nic_name            = "frontend-nic"
    }

nsg2 = {
    name = "backendnsg"
    location = "centralus"
    resource_group_name = "rgtest1"
    nic_name            = "backend-nic"
      }

}

association = {
  nicnsg1 ={
    # name = "nicnsgas-1"
    resource_group_name = "rgtest1"
    nic_name = "frontend-nic" 
    nsg_name = "frontendnsg"
     }

     nicnsg2 ={
    # name = "nicnsgas-2"
    resource_group_name = "rgtest1"
    nic_name = "backend-nic" 
    nsg_name = "backendnsg"
     }
}


vms = {
  vm1 = {
    vm_name             = "frontend-vm"
    location            = "centralus"
    resource_group_name = "rgtest1"
    vm_size             = "Standard_D2s_v3"
    admin_username      = "devopsadmin"
    admin_password      = "Devops@1234"
    nic_name            = "frontend-nic"
   
  }

  vm2 = {
    vm_name             = "backend-vm"
    location            = "centralus"
    resource_group_name = "rgtest1"
    vm_size             = "Standard_D2s_v3"
    admin_username      = "devopsadmin"
    admin_password      = "Devops@1234"
    nic_name            = "backend-nic"
    
    # nic_subnet_name     = "backend-subnet"
    # nic_vnet_name       = "vnetdevops-1"
    # nic_pip_name        = "backend-pip"
    }
}
