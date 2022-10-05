# [terraform-azurerm-apimanagement][1]

Manages an API Management Service.

## Getting Started

- Format and validate Terraform code before commit.

```shell
terraform init -upgrade \
    && terraform init -reconfigure -upgrade \
    && terraform fmt -recursive . \
    && terraform fmt -check \
    && terraform validate .
```

- Always fetch latest changes from upstream and rebase from it. Terraform documentation will always be updated with GitHub Actions. See also [.github/workflows/terraform.yml](.github/workflows/terraform.yml) GitHub Actions workflow.

```shell
git fetch --all --tags --prune --prune-tags \
  && git pull --rebase --all --prune --tags
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_api_management.api_management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_certificate_enabled"></a> [client\_certificate\_enabled](#input\_client\_certificate\_enabled) | (Optional) Enforce a client certificate to be presented on each request to the gateway? This is only supported when SKU type is `Consumption`. | `bool` | `null` | no |
| <a name="input_configuration"></a> [configuration](#input\_configuration) | (Optional) The configuration for block type arguments. | `any` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | (Optional) Enable the creation of this resource. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) The name of the environment. | `string` | n/a | yes |
| <a name="input_gateway_disabled"></a> [gateway\_disabled](#input\_gateway\_disabled) | (Optional) Disable the gateway in main region? This is only supported when `additional_location` is set. | `bool` | `null` | no |
| <a name="input_min_api_version"></a> [min\_api\_version](#input\_min\_api\_version) | (Optional) The version which the control plane API calls to API Management service are limited with version equal to or newer than. | `string` | `null` | no |
| <a name="input_notification_sender_email"></a> [notification\_sender\_email](#input\_notification\_sender\_email) | (Optional) Email address from which the notification will be sent. | `string` | `null` | no |
| <a name="input_override_location"></a> [override\_location](#input\_override\_location) | (Optional) Override the location of the resource. Under normal circumstances, it should not be used. | `string` | `null` | no |
| <a name="input_override_name"></a> [override\_name](#input\_override\_name) | (Optional) Override the name of the resource. Under normal circumstances, it should not be used. | `string` | `null` | no |
| <a name="input_public_ip_address_id"></a> [public\_ip\_address\_id](#input\_public\_ip\_address\_id) | (Optional) ID of a standard SKU IPv4 Public IP. | `string` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Is public access to the service allowed?. Defaults to `true`. | `bool` | `null` | no |
| <a name="input_publisher_email"></a> [publisher\_email](#input\_publisher\_email) | (Required) The email of publisher/company. | `string` | n/a | yes |
| <a name="input_publisher_name"></a> [publisher\_name](#input\_publisher\_name) | (Required) The name of publisher/company. | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | (Required) The resource group in which to create the resource. | `any` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Required) `sku_name` is a string consisting of two parts separated by an underscore(\_). The first part is the `name`, valid values include: `Consumption`, `Developer`, `Basic`, `Standard` and `Premium`. The second part is the `capacity` (e.g. the number of deployed units of the `sku`), which must be a positive `integer` (e.g. `Developer_1`). | `string` | n/a | yes |
| <a name="input_system_name"></a> [system\_name](#input\_system\_name) | (Required) The systen name which should be used for this resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_virtual_network_type"></a> [virtual\_network\_type](#input\_virtual\_network\_type) | (Optional) The type of virtual network you want to use, valid values include: `None`, `External`, `Internal`. | `string` | `null` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | (Optional) Specifies a list of Availability Zones in which this API Management service should be located. Changing this forces a new API Management service to be created. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_api_management"></a> [azurerm\_api\_management](#output\_azurerm\_api\_management) | The Azure API Management resource. |
<!-- END_TF_DOCS -->

[1]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management
