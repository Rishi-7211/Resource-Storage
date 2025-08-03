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
    key                  = "prod.terraform.tfstate"
  }

}
provider "azurerm" {
  features {}
  subscription_id = "2152b8fd-4dc5-47a1-8df7-361e1b4e4a6f"
}
resource "azurerm_resource_group" "motorg" {
  name     = "MotoRG"
  location = "East US"
}
resource "azurerm_storage_account" "motoacc" {
  name                     = "motostorageaccount98"
  resource_group_name      = "MotoRG"
  location                 = "West US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [ azurerm_resource_group.motorg ]
}
resource "azurerm_storage_container" "motocontainer" {
  name                  = "moto-container"
  storage_account_id    = azurerm_storage_account.motoacc.id
  container_access_type = "private"
  depends_on = [ azurerm_storage_account.motoacc ]
}
