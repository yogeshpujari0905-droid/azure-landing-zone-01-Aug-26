resource "azurerm_network_interface_security_group_association" "associationblock" {
  for_each = var.association
  network_interface_id      = data.azurerm_network_interface.nicdatablock[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsgdatablock[each.key].id
 }