resource "azurerm_resource_group" "hisham_rg" {
  name     = "hisham-rg"
  location = "East US"
}

module "monitor_action_groups" {
  for_each = { for action_group in var.monitor_action_groups : action_group.name => action_group }
  source   = "./modules/monitor_action_group"

  monitor_action_group_name       = each.value.name
  resource_group_name             = azurerm_resource_group.hisham_rg.name
  monitor_action_group_short_name = each.value.short_name
  monitor_action_group_enabled    = each.value.enabled

  monitor_action_group_actions = each.value.actions

  common_tags     = var.common_tags
  additional_tags = var.additional_tags
  service_tags    = var.service_tags

  depends_on = [azurerm_resource_group.hisham_rg]
}