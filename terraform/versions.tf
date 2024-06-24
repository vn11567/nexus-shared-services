terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = ">= 16.6.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "= 2.25.2"
    }
  }

  required_version = ">= 1.0.0"
}
