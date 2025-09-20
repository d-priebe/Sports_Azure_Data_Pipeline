#  Terraform configuration describing resource blocks for resource declariation 

# Describes infrastructure objects - Deploy resource group
resource "azurerm_resource_group" "terraform" {
  name     = "${var.project_name}-terraform"
  location = var.location
}
# Create Storage account via terraform deployment with local name "tfstate" - Serving as remote backend for storing tf state file
resource "azurerm_storage_account" "tfstate" {
  name                     = "${var.project_name}tfstate"
  resource_group_name      = azurerm_resource_group.terraform.name
  location                 = azurerm_resource_group.terraform.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
# Describe terraform resource for managing Azure Storage Container - I.E Provisions, updates, and deletes storage containers 
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate-container"
  storage_account_id  = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}