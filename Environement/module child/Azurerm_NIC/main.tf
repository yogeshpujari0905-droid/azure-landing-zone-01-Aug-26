resource "azurerm_network_interface" "nicblock" {
  for_each            = var.nics
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name


  ip_configuration {
    name                          = "ipconfigtest"
    subnet_id                     = data.azurerm_subnet.dbsubnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.dbpip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}