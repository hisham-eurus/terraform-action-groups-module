monitor_action_groups = [{
  name       = "exampleAg1"
  short_name = "exAg1"
  enabled    = true

  actions = {
    email_receiver = [ {
      name = "emailtohisham"
      email_address = "hisham.hasan@eurustechnologies.com"
    } ]
  }
}]


common_tags = {
  "common" = "something"
}

additional_tags = {
  "additional" = "moreso"
}

service_tags = {
  "service" = "vicers"
}