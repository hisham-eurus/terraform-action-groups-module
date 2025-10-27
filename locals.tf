locals {
  merged_tags = merge(
    var.common_tags, 
    var.additional_tags, 
    var.service_tags
    )
}