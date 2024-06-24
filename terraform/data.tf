data "azurerm_resource_group" "main" {
  name = var.env == "prod" ? "SHAREDSERVICES-RG" : "backstage-rg"
}

data "azurerm_resource_group" "chat" {
  name = var.env == "prod" ? "NEXUSCHAT-RG" : "backstage-rg"
}

data "azurerm_kubernetes_cluster" "main" {
  name                = "SHAREDSERVICES-01-AKS"
  resource_group_name = var.env == "prod" ? "SHAREDSERVICES-RG" : "backstage-rg"
}

data "azurerm_virtual_network" "aks" {
  name                = "SHAREDSERVICES-01-VNET"
  resource_group_name = var.env == "prod" ? "SHAREDSERVICES-RG" : "backstage-rg"
}

data "azurerm_subnet" "aks" {
  name                 = "aks-subnet"
  resource_group_name  = var.env == "prod" ? "SHAREDSERVICES-RG" : "backstage-rg"
  virtual_network_name = "SHAREDSERVICES-01-VNET"
}

data "azurerm_key_vault" "main" {
  name                = var.env == "prod" ? "synecloudpracticeprodkv" : "synecloudpracticekv"
  resource_group_name = var.env == "prod" ? "SHAREDSERVICES-RG" : "backstage-rg"
}

data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}

data "azurerm_subnet" "ctochatbot-david" {
  count                = var.env == "uat" ? 1 : 0
  name                 = "subnet-1"
  virtual_network_name = "vnet01"
  resource_group_name  = "cto-openai-demo1"
}
