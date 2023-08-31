terraform {

  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.68.0"
    }
  }

    backend "azurerm" {
      resource_group_name  = "remote-state-terraform-equipe2"
      storage_account_name = "storageaccountremote2"
      container_name       = "remote-state-terraform"
      key                  = "azure-vnet/terraform.tfstate"
    }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "remote-state" {
  backend = "azurerm"
  config = {
    resource_group_name  = "remote-state-terraform-equipe2"
    storage_account_name = "storageaccountremote2"
    container_name       = "remote-state-terraform"
    key                  = "azure-remote-state/terraform.tfstate"
  }
}