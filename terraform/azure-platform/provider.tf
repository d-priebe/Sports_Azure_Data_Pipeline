terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "desportspipe-terraform"
    storage_account_name = "desportspipetfstate"
    container_name       = "tfstate-container"
    key                  = "dev/state.tfstate" 
  }
}

provider "azurerm" {
  features {}
}