# Login to Azure (if not already logged in)
terraform {
  backend "azurerm" {
    # The name of the Azure Storage account
    storage_account_name = "exampletfstateaccount"

    # The name of the Blob Container within the storage account
    container_name = "tfstate"

    # The path/name of the state file within the container
    key = "prod/terraform.tfstate"

    # The name of the Resource Group where the storage account exists
    resource_group_name = "example-tfstate-rg"

    # Optional: Authentication via Azure CLI
    # use_cli = true

    # Optional: Authentication via Azure AD (requires specific permissions)
    # use_azuread_auth = true
  }
}
