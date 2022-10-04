variable "environment" {
  description = "(Required) The name of the environment."
  type        = string
  validation {
    condition = contains([
      "dev",
      "test",
      "prod",
    ], var.environment)
    error_message = "Possible values are dev, test, and prod."
  }
}

# This `name` variable is replaced by the use of `system_name` and `environment` variables.
# variable "name" {
#   description = "(Required) The name which should be used for this resource. Changing this forces a new resource to be created."
#   type        = string
# }

variable "system_name" {
  description = "(Required) The systen name which should be used for this resource. Changing this forces a new resource to be created."
  type        = string
}

variable "override_name" {
  description = "(Optional) Override the name of the resource. Under normal circumstances, it should not be used."
  default     = null
  type        = string
}

variable "override_location" {
  description = "(Optional) Override the location of the resource. Under normal circumstances, it should not be used."
  default     = null
  type        = string
}

variable "resource_group" {
  description = "(Required) The resource group in which to create the resource."
  type        = any
}

# This `resource_group_name` variable is replaced by the use of `resource_group` variable.
# variable "resource_group_name" {
#   description = "(Required) The name of the resource group where the resource should exist. Changing this forces a new resource to be created."
#   type        = string
# }

# This `location` variable is replaced by the use of `resource_group` variable.
# variable "location" {
#   description = "(Required) The location where the resource should exist. Changing this forces a new resource to be created."
#   type        = string
# }

variable "enabled" {
  description = "(Optional) Enable the creation of this resource."
  type        = bool
  default     = true
}

variable "publisher_name" {
  description = "(Required) The name of publisher/company."
  type        = string
}

variable "publisher_email" {
  description = "(Required) The email of publisher/company."
  type        = string
}

variable "sku_name" {
  description = "(Required) `sku_name` is a string consisting of two parts separated by an underscore(_). The first part is the `name`, valid values include: `Consumption`, `Developer`, `Basic`, `Standard` and `Premium`. The second part is the `capacity` (e.g. the number of deployed units of the `sku`), which must be a positive `integer` (e.g. `Developer_1`)."
  type        = string
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null # {}
}
