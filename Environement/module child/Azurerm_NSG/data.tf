# data "azurerm_network_security_group" "nsgdatablock" {
#     for_each = var.nsgs
#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name
# }



# data "azurerm_network_interface" "nicdatablock" {
#     for_each = var.nsgs
#   name                = each.value.nic_name 
#   resource_group_name = each.value.resource_group_name
# }
