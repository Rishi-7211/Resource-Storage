terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.38.1"
    }
  }
  backend "azurerm" {
    resource_group_name   = "Vaishanvi_RG"
    storage_account_name  = "vaishanvistorage"
    container_name        = "vaishanvicontainer"
    key                   = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "2152b8fd-4dc5-47a1-8df7-361e1b4e4a6f"
}

