data "azurerm_subnet" "dbsubnet" {
  for_each             = var.nics
  name                 = each.value.nic_subnet_name
  virtual_network_name = each.value.nic_vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "dbpip" {
  for_each            = var.nics
  name                = each.value.nic_pip_name
  resource_group_name = each.value.resource_group_name
}

