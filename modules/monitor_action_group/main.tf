resource "azurerm_monitor_action_group" "this" {
  name                = var.monitor_action_group.name
  resource_group_name = var.resource_group_name
  short_name          = var.monitor_action_group.short_name
  enabled             = var.monitor_action_group.enabled

  dynamic "arm_role_receiver" {
    for_each = var.monitor_action_group.arm_role_receiver
    content {
      name                    = arm_role_receiver.value.name
      role_id                 = arm_role_receiver.value.role_id
      use_common_alert_schema = arm_role_receiver.value.use_common_alert_schema
    }
  }

  dynamic "automation_runbook_receiver" {
    for_each = var.monitor_action_group.automation_runbook_receiver
    content {
      name                    = automation_runbook_receiver.value.name
      automation_account_id   = automation_runbook_receiver.value.automation_account_id
      runbook_name            = automation_runbook_receiver.value.runbook_name
      webhook_resource_id     = automation_runbook_receiver.value.webhook_resource_id
      is_global_runbook       = automation_runbook_receiver.value.is_global_runbook
      service_uri             = automation_runbook_receiver.value.service_uri
      use_common_alert_schema = automation_runbook_receiver.value.use_common_alert_schema
    }
  }

  dynamic "azure_app_push_receiver" {
    for_each = var.monitor_action_group.azure_app_push_receiver
    content {
      name          = azure_app_push_receiver.value.name
      email_address = azure_app_push_receiver.value.email_address
    }
  }

  dynamic "azure_function_receiver" {
    for_each = var.monitor_action_group.azure_function_receiver
    content {
      name                     = azure_function_receiver.value.name
      function_app_resource_id = azure_function_receiver.value.function_app_resource_id
      function_name            = azure_function_receiver.value.function_name
      http_trigger_url         = azure_function_receiver.value.http_trigger_url
      use_common_alert_schema  = azure_function_receiver.value.use_common_alert_schema
    }
  }

  dynamic "email_receiver" {
    for_each = var.monitor_action_group.email_receiver
    content {
      name                    = email_receiver.value.name
      email_address           = email_receiver.value.email_address
      use_common_alert_schema = lookup(email_receiver.value, "use_common_alert_schema", false)
    }
  }

  dynamic "event_hub_receiver" {
    for_each = var.monitor_action_group.event_hub_receiver
    content {
      name                    = event_hub_receiver.value.name
      event_hub_namespace     = event_hub_receiver.value.event_hub_namespace
      event_hub_name          = event_hub_receiver.value.event_hub_name
      subscription_id         = event_hub_receiver.value.subscription_id
      use_common_alert_schema = event_hub_receiver.value.use_common_alert_schema
    }
  }

  dynamic "itsm_receiver" {
    for_each = var.monitor_action_group.itsm_receiver
    content {
      name                 = itsm_receiver.value.name
      workspace_id         = itsm_receiver.value.workspace_id
      connection_id        = itsm_receiver.value.connection_id
      ticket_configuration = itsm_receiver.value.ticket_configuration
      region               = itsm_receiver.value.region
    }
  }

  dynamic "logic_app_receiver" {
    for_each = var.monitor_action_group.logic_app_receiver
    content {
      name                    = logic_app_receiver.value.name
      resource_id             = logic_app_receiver.value.resource_id
      callback_url            = logic_app_receiver.value.callback_url
      use_common_alert_schema = logic_app_receiver.value.use_common_alert_schema
    }
  }

  dynamic "sms_receiver" {
    for_each = var.monitor_action_group.sms_receiver
    content {
      name         = sms_receiver.value.name
      country_code = sms_receiver.value.country_code
      phone_number = sms_receiver.value.phone_number
    }
  }

  dynamic "voice_receiver" {
    for_each = var.monitor_action_group.voice_receiver
    content {
      name         = voice_receiver.value.name
      country_code = voice_receiver.value.country_code
      phone_number = voice_receiver.value.phone_number
    }
  }

  dynamic "webhook_receiver" {
    for_each = var.monitor_action_group.webhook_receiver
    content {
      name                    = webhook_receiver.value.name
      service_uri             = webhook_receiver.value.service_uri
      use_common_alert_schema = webhook_receiver.value.use_common_alert_schema
      aad_auth {
        object_id      = webhook_receiver.value.aad_auth.object_id
        identifier_uri = webhook_receiver.value.aad_auth.identifier_uri
        tenant_id      = webhook_receiver.value.aad_auth.tenant_id
      }
    }
  }

  tags = var.all_tags
}