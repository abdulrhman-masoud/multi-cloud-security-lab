terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "multicloud_rg" {
  name     = "rg-multicloud-security-prod"
  location = "East US"

  tags = {
    Environment = "Production"
    Framework   = "ZeroTrust"
  }
}

resource "azurerm_virtual_network" "multicloud_vnet" {
  name                = "vnet-multicloud-azure"
  address_space       = ["10.20.0.0/16"]
  location            = azurerm_resource_group.multicloud_rg.location
  resource_group_name = azurerm_resource_group.multicloud_rg.name

  tags = {
    SecurityControl = "NetworkIsolation"
  }
}

resource "azurerm_log_analytics_workspace" "multicloud_law" {
  name                = "law-multicloud-central-audit"
  location            = azurerm_resource_group.multicloud_rg.location
  resource_group_name = azurerm_resource_group.multicloud_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 365

  tags = {
    Purpose = "CentralizedLogging-Defender-Sentinel"
  }
}