output "vault_uri" {
  value       = azurerm_key_vault.application.vault_uri
  description = "The Azure Key Vault URI."
}

output "secret_sauce" {
  value       = azurerm_key_vault_secret.secret_sauce.name
  description = "The secret."
}
