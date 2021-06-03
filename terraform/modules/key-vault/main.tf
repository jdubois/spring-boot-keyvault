
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "application" {
  name                = "examplekeyvault"
  resource_group_name = var.resource_group
  location            = var.location

  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 90

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "create",
      "get",
    ]

    secret_permissions = [
      "set",
      "get",
      "delete",
      "purge",
      "recover"
    ]
  }

  tags = {
    "environment" = var.environment
  }
}

resource "azurerm_key_vault_secret" "secret_sauce" {
  name         = "secret-sauce"
  value        = "szechuan"
  key_vault_id = azurerm_key_vault.application.id
}
