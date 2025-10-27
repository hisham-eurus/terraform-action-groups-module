resource "azurerm_resource_group" "hisham_rg" {
  name     = "hisham-rg"
  location = "East US"
}

data "azurerm_client_config" "current" {

}

module "monitor_action_groups" {
  for_each             = { for action_group in var.monitor_action_groups : action_group.name => action_group }
  source               = "./modules/monitor_action_group"
  monitor_action_group = each.value

  resource_group_name = azurerm_resource_group.hisham_rg.name

  all_tags = local.merged_tags

  depends_on = [azurerm_resource_group.hisham_rg]
}