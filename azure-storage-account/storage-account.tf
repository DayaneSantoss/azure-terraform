
resource "azurerm_storage_account" "storage_account" {
  name                     = "storageaccountremote2"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  blob_properties {
    versioning_enabled = true
  }

  tags = local.common_tags
}

resource "azurerm_storage_container" "container" {
  name                 = "remote-state-terraform"
  storage_account_name = azurerm_storage_account.storage_account.name
}