provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-backup-demo"
  location = "eastus"
}

# Storage Account
resource "azurerm_storage_account" "sa" {
  name                     = "bkupstorage${random_integer.rand.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Storage Containers
resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "backup" {
  name                  = "backup"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

# Random suffix for unique name
resource "random_integer" "rand" {
  min = 10000
  max = 99999
}
resource "azurerm_key_vault" "example" {
  name                        = "my-keyvault-demo"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
}

resource "azurerm_key_vault_secret" "backup_path" {
  name         = "BACKUP-PATH"
  value        = "/home/backup"
  key_vault_id = azurerm_key_vault.example.id
}
