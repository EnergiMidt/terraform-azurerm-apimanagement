locals {
  name     = var.override_name == null ? "${var.system_name}-${lower(var.environment)}-apim" : var.override_name
  location = var.override_location == null ? var.resource_group.location : var.override_location

  api_management = concat(azurerm_api_management.api_management, [null])[0]
}

resource "azurerm_api_management" "api_management" {
  count = var.enabled ? 1 : 0

  name                = local.name
  location            = local.location
  resource_group_name = var.resource_group.name

  publisher_name  = var.configuration.publisher_name
  publisher_email = var.configuration.publisher_email
  sku_name        = var.configuration.sku_name

  # checkov:skip=CKV_AZURE_107: The `virtual_network_configuration` variable is not implement yet.
  # https://docs.bridgecrew.io/docs/ensure-azure-cosmosdb-has-local-authentication-disabled

  dynamic "additional_location" {
    for_each = try(var.configuration.additional_location, null) != null ? [var.configuration.additional_location] : []

    content {

      location = try(additional_location.value.location, null)
      dynamic "virtual_network_configuration" {
        for_each = try(var.configuration.virtual_network_configuration, null) != null ? [var.configuration.virtual_network_configuration] : []

        content {

          subnet_id = coalesce(
            try(each.value.subnet_id, null),
            try(var.vnets[virtual_network_configuration.value.lz_key][virtual_network_configuration.value.vnet_key].subnets[virtual_network_configuration.value.subnet_key].id, null),
            try(var.vnets[var.client_config.landingzone_key][virtual_network_configuration.value.vnet_key].subnets[virtual_network_configuration.value.subnet_key].id, null)
          )
        }
      }
    }
  }

  dynamic "certificate" {
    for_each = try(var.configuration.certificate, null) != null ? [var.configuration.certificate] : []

    content {

      encoded_certificate  = try(certificate.value.encoded_certificate, null)
      store_name           = try(certificate.value.store_name, null)
      certificate_password = try(certificate.value.certificate_password, null)
    }
  }

  client_certificate_enabled = try(var.configuration.client_certificate_enabled, null)
  gateway_disabled           = try(var.configuration.gateway_disabled, null)
  min_api_version            = try(var.configuration.min_api_version, null)
  zones                      = try(var.configuration.zones, null)

  dynamic "identity" {
    for_each = try(var.configuration.identity, null) != null ? [var.configuration.identity] : []

    content {
      type = identity.value.type
      identity_ids = coalesce(
        try(var.configuration.identity.identity_ids, null)
      )
    }
  }

  dynamic "hostname_configuration" {
    for_each = try(var.configuration.hostname_configuration, null) != null ? [var.configuration.hostname_configuration] : []

    content {
      dynamic "management" {
        for_each = try(var.configuration.management, null) != null ? [var.configuration.management] : []

        content {
          host_name                    = try(management.value.host_name, null)
          key_vault_id                 = try(management.value.key_vault_id, null)
          certificate                  = try(management.value.certificate, null)
          certificate_password         = try(management.value.certificate_password, null)
          negotiate_client_certificate = try(management.value.negotiate_client_certificate, null)
        }
      }
      dynamic "portal" {
        for_each = try(var.configuration.portal, null) != null ? [var.configuration.portal] : []

        content {
          host_name                    = try(portal.value.host_name, null)
          key_vault_id                 = try(portal.value.key_vault_id, null)
          certificate                  = try(portal.value.certificate, null)
          certificate_password         = try(portal.value.certificate_password, null)
          negotiate_client_certificate = try(portal.value.negotiate_client_certificate, null)
        }
      }
      dynamic "developer_portal" {
        for_each = try(var.configuration.developer_portal, null) != null ? [var.configuration.developer_portal] : []

        content {
          host_name                    = try(developer_portal.value.host_name, null)
          key_vault_id                 = try(developer_portal.value.key_vault_id, null)
          certificate                  = try(developer_portal.value.certificate, null)
          certificate_password         = try(developer_portal.value.certificate_password, null)
          negotiate_client_certificate = try(developer_portal.value.negotiate_client_certificate, null)
        }
      }
      dynamic "proxy" {
        for_each = try(var.configuration.proxy, null) != null ? [var.configuration.proxy] : []

        content {

          default_ssl_binding          = try(proxy.value.default_ssl_binding, null)
          host_name                    = try(proxy.value.host_name, null)
          key_vault_id                 = try(proxy.value.key_vault_id, null)
          certificate                  = try(proxy.value.certificate, null)
          certificate_password         = try(proxy.value.certificate_password, null)
          negotiate_client_certificate = try(proxy.value.negotiate_client_certificate, null)
        }
      }
      dynamic "scm" {
        for_each = try(var.configuration.scm, null) != null ? [var.configuration.scm] : []

        content {
          host_name                    = try(scm.value.host_name, null)
          key_vault_id                 = try(scm.value.key_vault_id, null)
          certificate                  = try(scm.value.certificate, null)
          certificate_password         = try(scm.value.certificate_password, null)
          negotiate_client_certificate = try(scm.value.negotiate_client_certificate, null)
        }
      }
    }
  }

  notification_sender_email = try(var.configuration.notification_sender_email, null)

  dynamic "policy" {
    for_each = try(var.configuration.policy, null) != null ? [var.configuration.policy] : []

    content {

      xml_content = try(policy.value.xml_content, null)
      xml_link    = try(policy.value.xml_link, null)
    }
  }

  dynamic "protocols" {
    for_each = try(var.configuration.protocols, null) != null ? [var.configuration.protocols] : []

    content {

      enable_http2 = try(protocols.value.enable_http2, null)
    }
  }

  dynamic "security" {
    for_each = try(var.configuration.security, null) != null ? [var.configuration.security] : []

    content {

      enable_backend_ssl30                                = try(security.value.enable_backend_ssl30, null)
      enable_backend_tls10                                = try(security.value.enable_backend_tls10, null)
      enable_backend_tls11                                = try(security.value.enable_backend_tls11, null)
      enable_frontend_ssl30                               = try(security.value.enable_frontend_ssl30, null)
      enable_frontend_tls10                               = try(security.value.enable_frontend_tls10, null)
      enable_frontend_tls11                               = try(security.value.enable_frontend_tls11, null)
      tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = try(security.value.tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled, null)
      tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled = try(security.value.tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled, null)
      tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled   = try(security.value.tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled, null)
      tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled   = try(security.value.tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled, null)
      tls_rsa_with_aes128_cbc_sha256_ciphers_enabled      = try(security.value.tls_rsa_with_aes128_cbc_sha256_ciphers_enabled, null)
      tls_rsa_with_aes128_cbc_sha_ciphers_enabled         = try(security.value.tls_rsa_with_aes128_cbc_sha_ciphers_enabled, null)
      tls_rsa_with_aes128_gcm_sha256_ciphers_enabled      = try(security.value.tls_rsa_with_aes128_gcm_sha256_ciphers_enabled, null)
      tls_rsa_with_aes256_cbc_sha256_ciphers_enabled      = try(security.value.tls_rsa_with_aes256_cbc_sha256_ciphers_enabled, null)
      tls_rsa_with_aes256_cbc_sha_ciphers_enabled         = try(security.value.tls_rsa_with_aes256_cbc_sha_ciphers_enabled, null)
      triple_des_ciphers_enabled                          = try(security.value.triple_des_ciphers_enabled, null)
    }
  }

  dynamic "sign_in" {
    for_each = try(var.configuration.sign_in, null) != null ? [var.configuration.sign_in] : []

    content {

      enabled = try(sign_in.value.enabled, null)
    }
  }

  dynamic "sign_up" {
    for_each = try(var.configuration.sign_up, null) != null ? [var.configuration.sign_up] : []

    content {

      enabled = try(sign_up.value.enabled, null)
      dynamic "terms_of_service" {
        for_each = try(var.configuration.terms_of_service, null) != null ? [var.configuration.terms_of_service] : []

        content {

          consent_required = try(terms_of_service.value.consent_required, null)
          enabled          = try(terms_of_service.value.enabled, null)
          text             = try(terms_of_service.value.text, null)
        }
      }
    }
  }

  dynamic "tenant_access" {
    for_each = try(var.configuration.tenant_access, null) != null ? [var.configuration.tenant_access] : []

    content {

      enabled = try(tenant_access.value.enabled, null)
    }
  }

  public_ip_address_id          = try(var.configuration.public_ip_address_id, null)
  public_network_access_enabled = try(var.configuration.public_network_access_enabled, null)
  virtual_network_type          = try(var.configuration.virtual_network_type, null)

  dynamic "virtual_network_configuration" {
    for_each = try(var.configuration.virtual_network_configuration, null) != null ? [var.configuration.virtual_network_configuration] : []

    content {

      subnet_id = coalesce(
        try(each.value.subnet_id, null),
        try(var.vnets[virtual_network_configuration.value.lz_key][virtual_network_configuration.value.vnet_key].subnets[virtual_network_configuration.value.subnet_key].id, null),
        try(var.vnets[var.client_config.landingzone_key][virtual_network_configuration.value.vnet_key].subnets[virtual_network_configuration.value.subnet_key].id, null)
      )
    }
  }

  tags = var.tags
}
