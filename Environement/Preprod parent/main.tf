module "resource_group" {
    source = "../module child/Azurerm_resource_group"
    rgtest = var.rgtest
}

module "virtual_network" {
    depends_on = [ module.resource_group ]
    source = "../module child/Azurerm_Vnet"
    vnettest = var.vnettest    
}

module "subnets" {
    depends_on = [ module.virtual_network ]
    source = "../module child/Azurerm_subnet"
    subnets = var.subnets
}

module "pip" {
    depends_on = [ module.resource_group ]
    source = "../module child/Azurerm_pip_address"
    pips = var.pips
}

module "nic" {
    depends_on = [ module.subnets,module.pip ]
    source = "../module child/Azurerm_NIC"
    nics = var.nics

}

module "virtual_machine" {
    depends_on = [module.nic,module.network_security_group,module.subnets]
    source = "../module child/Azurerm_VM"
    vms = var.vms
}

module "network_security_group" {
    depends_on = [ module.subnets,module.nic ]
    source ="../module child/Azurerm_NSG"
    nsgs = var.nsgs
}

module "nic_nsg_association" {
    depends_on = [ module.nic,module.network_security_group ]
    source = "../module child/Azurerm_NSG_NSG_Association"
    association = var.association
}
