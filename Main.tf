terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.38.1"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "2152b8fd-4dc5-47a1-8df7-361e1b4e4a6f"
}

