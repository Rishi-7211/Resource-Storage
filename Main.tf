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
  subscription_id = "50fb151d-0992-4631-9cc9-86f052a3e0b0"
}

resource "azurerm_resource_group" "motorg" {
  name     = "MotoRG12"
  location = "East US"
}

resource "azurerm_storage_account" "motoacc" {
  name                     = "motostorageaccount9817"
  resource_group_name      = "MotoRG12"
  location                 = "West US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
depends_on = [azurerm_resource_group.motorg]
}
resource "azurerm_storage_container" "motocontainer" {
  name                  = "moto-container"
  storage_account_id    = azurerm_storage_account.motoacc.id
  container_access_type = "private"
depends_on = [azurerm_storage_account.motoacc]
}
