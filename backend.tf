terraform {
  backend "azurerm" {
    resource_group_name  = "azure-webapp-rg"
    storage_account_name = "azurewebapsa"
    container_name       = "azurewebappco"
    key                  = "./terraform.tfstate"
  }
}