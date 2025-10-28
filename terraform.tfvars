monitor_action_groups = [
  {
    name                = "Example Alert Group 1"
    resource_group_name = "hisham-rg"
    short_name          = "exampleAG1"

    email_receiver = [
      {
        name                    = "sendtohisham"
        email_address           = "hisham.hasan@eurustechnologies.com"
        use_common_alert_schema = false
      },
      {
        name                    = "sendtosm1"
        email_address           = "hishhasanstudent@gmail.com"
        use_common_alert_schema = false
      }
    ]
  },
  {
    name                = "Example AG 2"
    resource_group_name = "hisham-rg"
    short_name          = "exampleAg2"
    enabled             = false
  }
]

common_tags = {
  "common" = "something"
}

additional_tags = {
  "additional" = "moreso"
}

service_tags = {
  "service" = "vicers"
}