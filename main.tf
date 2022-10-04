locals {
  name     = var.override_name == null ? "${var.system_name}-${lower(var.environment)}-apim" : var.override_name
  location = var.override_location == null ? var.resource_group.location : var.override_location

  api_management = concat(azurerm_api_management.api_management.*, [null])[0]
}

resource "azurerm_api_management" "api_management" {
  count = var.enabled ? 1 : 0

  name                = local.name
  location            = local.location
  resource_group_name = var.resource_group.name

  publisher_name  = var.publisher_name
  publisher_email = var.publisher_email
  sku_name        = var.sku_name

  # checkov:skip=CKV_AZURE_107: The `virtual_network_configuration` variable is not implement yet.
  # https://docs.bridgecrew.io/docs/ensure-azure-cosmosdb-has-local-authentication-disabled

  tags = var.tags
}
