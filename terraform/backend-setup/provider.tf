terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "desportspipe"
    storage_account_name = "desoccerapi"
    container_name       = "tfstate"
    key                  = "dev/state.tfstate" # Can differentiate between dev & prod via prod/state.tfstate, etc.
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}