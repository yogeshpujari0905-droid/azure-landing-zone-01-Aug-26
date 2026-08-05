resource "azurerm_resource_group" "rg1block" {
    for_each = var.rgtest
  name     = each.value.name
  location = each.value.location
}