# Will deploy a CosmosDB account with a MongoDB API and a single container
module "cosmos" {
  source  = "gitlab.com/synechron-code/azure-cosmosdb-mongo/azurerm"
  version = "0.0.5"

  location                    = var.location
  resource_group_name         = data.azurerm_resource_group.main.name
  tags                        = merge({ "Environment" : var.env }, var.tags)
  name                        = var.env == "prod" ? "nexus-01-prod-mongo" : "nexus-01-mongo"
  database_name               = "nexus-mongo"
  collection_name             = "nexus-mongo-rfp"
  collection_index_keys       = ["_id"]
  collection_index_uniqueness = true

  # For UAT access
  ip_range_filter                   = var.env == "prod" ? "" : ""
  is_virtual_network_filter_enabled = var.env == "prod" ? true : false
  public_network_access_enabled     = var.env == "prod" ? false : true

  # For Private Endpoint
  enable_private_endpoint = true
  vnet_rg_name            = data.azurerm_virtual_network.aks.resource_group_name
  vnet_name               = data.azurerm_virtual_network.aks.name
  subnet_id               = data.azurerm_subnet.aks.id
}


# TODO replace this with Cosmos role & RBAC
resource "azurerm_key_vault_secret" "cosmosmongo_connection_string" {
  key_vault_id = data.azurerm_key_vault.main.id
  name         = "cosmosmongo-connection-string"
  value        = module.cosmos.connection_string
}

locals {
  ip_pj_office = "167.98.11.196"
}

module "aisearch" {
  source  = "gitlab.com/synechron-code/azure-ai-search/azurerm"
  version = "0.0.4"

  location                      = var.location
  resource_group_name           = data.azurerm_resource_group.main.name
  tags                          = merge({ "Environment" : var.env }, var.tags)
  name                          = var.env == "prod" ? "nexus-01-prod-aisearch" : "nexus-01-aisearch"
  sku                           = "standard"
  public_network_access_enabled = var.env == "uat" ? true : false
  allowed_ips                   = var.env == "uat" ? [local.ip_pj_office] : []

  # Permit AD only, no local keys
  local_authentication_enabled = false

  # For Private Endpoint
  enable_private_endpoint = true
  vnet_rg_name            = data.azurerm_virtual_network.aks.resource_group_name
  vnet_name               = data.azurerm_virtual_network.aks.name
  subnet_id               = data.azurerm_subnet.aks.id
}


# Grant the automation SP KV access
resource "azurerm_key_vault_access_policy" "ai_automation_sp" {
  key_vault_id = data.azurerm_key_vault.main.id
  object_id    = data.azurerm_client_config.current.object_id
  tenant_id    = data.azurerm_subscription.current.tenant_id
  key_permissions = [
    "GetRotationPolicy",
    "SetRotationPolicy",
    "Create",
    "Update",
    "Get",
    "Delete",
    "Purge",
    "Recover"
  ]

  secret_permissions = [
    "Set",
    "Get",
    "Delete",
    "Purge",
    "Recover"
  ]
}

# For deployment of things from within Azure and to avoid dependence on shared runners
locals {
  ai_gitlab_group_id = "77550671"
}

# Removed Gitlab Runner from Terraform given it is currently being problematic
# Deliberately not removing the code because we'll want to re-add it later.
# Need to urgently get Canada provisioned
#module "kubernetes_gitlab_runner" {
#  source             = "gitlab.com/synechron-code/kubernetes-gitlab-runner/helm"
#  namespace          = "gitlab-runner-ai"
#  version            = "0.0.6"
#  gitlab_group_id    = local.ai_gitlab_group_id
#  runner_description = "Runner for the AI Group and Nexus"
#  runner_tag_list    = ["ai", "ai-${lower(var.env)}"]
#  values = [
#    "replicas: 2"
#  ]
#}
