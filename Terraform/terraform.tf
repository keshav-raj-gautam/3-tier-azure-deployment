terraform {

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = #Your remote project name
    workspaces {
      name = #Your workspace name
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  
  features {}
}
