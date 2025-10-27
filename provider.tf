terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">4.46.0"
    }
  }
}

provider "azurerm" {

  features {}

  # In version 4 of azurerm, subscription id is mandatory.
  # export ARM_SUBSCRIPTION_ID=00000000-xxxx-xxxx-xxxx-xxxxxxxxxxxx
}
