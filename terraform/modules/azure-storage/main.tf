# Create Storage account via terraform deployment
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier
  is_hns_enabled           = true
  tags                     = var.tags
}
# Describe terraform resource for managing Azure Storage Container - I.E Provisions, updates, and deletes storage containers 
resource "azurerm_storage_container" "container" {
  for_each              = toset(var.container_names)
  name                  = each.key
  storage_account_id  = azurerm_storage_account.storage.id
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.storage]
}