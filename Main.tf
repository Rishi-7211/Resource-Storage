terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Rishi_RG"
    storage_account_name = "storage72111"
    container_name       = "terraformconatiner"
    key                  = "prod.tfstate"
  }

}
provider "azurerm" {
  features {}
  subscription_id = "2152b8fd-4dc5-47a1-8df7-361e1b4e4a6f"
}

