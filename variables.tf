variable "monitor_action_groups" {
  description = "Map of Azure Monitor Action Groups"
  type = map(object({
    name                = string
    resource_group_name = string
    short_name          = string
    enabled             = optional(bool, true)

    arm_role_receiver = optional(list(object({
      name                    = string
      role_id                 = string
      use_common_alert_schema = bool
    })), [])

    automation_runbook_receiver = optional(list(object({
      name                    = string
      automation_account_id   = string
      runbook_name            = string
      webhook_resource_id     = string
      is_global_runbook       = bool
      service_uri             = string
      use_common_alert_schema = bool
    })), [])

    azure_app_push_receiver = optional(list(object({
      name          = string
      email_address = string
    })), [])

    azure_function_receiver = optional(list(object({
      name                     = string
      function_app_resource_id = string
      function_name            = string
      http_trigger_url         = string
      use_common_alert_schema  = bool
    })), [])

    email_receiver = optional(list(object({
      name                    = string
      email_address           = string
      use_common_alert_schema = optional(bool)
    })), [])

    event_hub_receiver = optional(list(object({
      name                    = string
      event_hub_namespace     = string
      event_hub_name          = string
      subscription_id         = string
      use_common_alert_schema = bool
    })), [])

    itsm_receiver = optional(list(object({
      name                 = string
      workspace_id         = string
      connection_id        = string
      ticket_configuration = string
      region               = string
    })), [])

    logic_app_receiver = optional(list(object({
      name                    = string
      resource_id             = string
      callback_url            = string
      use_common_alert_schema = bool
    })), [])

    sms_receiver = optional(list(object({
      name         = string
      country_code = string
      phone_number = string
    })), [])

    voice_receiver = optional(list(object({
      name         = string
      country_code = string
      phone_number = string
    })), [])

    webhook_receiver = optional(list(object({
      name                    = string
      service_uri             = string
      use_common_alert_schema = bool
    })), [])

  }))
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "additional_tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "service_tags" {
  description = "Service-specific tags"
  type        = map(string)
  default     = {}
}
