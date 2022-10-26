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

# variable "publisher_name" {
#   description = "(Required) The name of publisher/company."
#   type        = string
# }

# variable "publisher_email" {
#   description = "(Required) The email of publisher/company."
#   type        = string
# }

# variable "sku_name" {
#   description = "(Required) `sku_name` is a string consisting of two parts separated by an underscore(_). The first part is the `name`, valid values include: `Consumption`, `Developer`, `Basic`, `Standard` and `Premium`. The second part is the `capacity` (e.g. the number of deployed units of the `sku`), which must be a positive `integer` (e.g. `Developer_1`)."
#   type        = string
# }

variable "configuration" {
  description = "(Optional) The configuration for block type arguments."
  type        = any
  default     = null
}

# This `additional_location` variable is replaced by the use of `configuration` variables.
# variable "additional_location " {
#   description = "(Optional) One or more additional_location blocks as defined below."
# }

# This `certificate` variable is replaced by the use of `configuration` variables.
# variable "certificate" {
#   description = "(Optional) One or more (up to 10) certificate blocks as defined below."
# }

# variable "client_certificate_enabled" {
#   description = "(Optional) Enforce a client certificate to be presented on each request to the gateway? This is only supported when SKU type is `Consumption`."
#   type        = bool
#   default     = null
# }

# variable "gateway_disabled" {
#   description = "(Optional) Disable the gateway in main region? This is only supported when `additional_location` is set."
#   type        = bool
#   default     = null
# }

# variable "min_api_version" {
#   description = "(Optional) The version which the control plane API calls to API Management service are limited with version equal to or newer than."
#   type        = string
#   default     = null
# }

# variable "zones" {
#   description = "(Optional) Specifies a list of Availability Zones in which this API Management service should be located. Changing this forces a new API Management service to be created."
#   type        = list(string)
#   default     = null
# }

# This `identity` variable is replaced by the use of `configuration` variables.
# variable "identity" {
#   description = "(Optional) An identity block as defined below."
# }

# This `hostname_configuration` variable is replaced by the use of `configuration` variables.
# variable "hostname_configuration" {
#   description = "(Optional) A hostname_configuration block as defined below."
# }

# variable "notification_sender_email" {
#   description = "(Optional) Email address from which the notification will be sent."
#   type        = string
#   default     = null
# }

# This `policy` variable is replaced by the use of `configuration` variables.
# variable "policy" {
#   description = "(Optional) A policy block as defined below."
# }

# This `protocols` variable is replaced by the use of `configuration` variables.
# variable "protocols" {
#   description = "(Optional) A protocols block as defined below."
# }

# This `security` variable is replaced by the use of `configuration` variables.
# variable "security" {
#   description = "(Optional) A security block as defined below."
# }

# This `sign_in` variable is replaced by the use of `configuration` variables.
# variable "sign_in" {
#   description = "(Optional) A sign_in block as defined below."
# }

# This `sign_up` variable is replaced by the use of `configuration` variables.
# variable "sign_up" {
#   description = "(Optional) A sign_up block as defined below."
# }

# This `tenant_access` variable is replaced by the use of `configuration` variables.
# variable "tenant_access" {
#   description = "(Optional) A tenant_access block as defined below."
# }

# variable "public_ip_address_id" {
#   description = "(Optional) ID of a standard SKU IPv4 Public IP."
#   type        = string
#   default     = null
# }

# variable "public_network_access_enabled" {
#   description = "(Optional) Is public access to the service allowed?. Defaults to `true`."
#   type        = bool
#   default     = null
# }

# variable "virtual_network_type" {
#   description = "(Optional) The type of virtual network you want to use, valid values include: `None`, `External`, `Internal`."
#   type        = string
#   default     = null
# }

# This `virtual_network_configuration` variable is replaced by the use of `configuration` variables.
# variable "virtual_network_configuration" {
#   description = "(Optional) A virtual_network_configuration block as defined below. Required when `virtual_network_type` is `External` or `Internal`."
# }

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
