terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Rishi_RG"
    storage_account_name = "storage72111"
    container_name       = "terraformcontainer"
    key                  = "prod.tfstate"
  }

}
provider "azurerm" {
  features {}
  subscription_id = "2152b8fd-4dc5-47a1-8df7-361e1b4e4a6f"
}

