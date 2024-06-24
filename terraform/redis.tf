# Because we're using AKS with Basic networking, we need to jump through some hoops to grab the public IP
# We do this because - prior to switching over to a Private Endpoint - we add a firewall rule to allow access from the AKS cluster
data "azurerm_lb" "kubernetes" {
  name                = "kubernetes"
  resource_group_name = data.azurerm_kubernetes_cluster.main.node_resource_group
}

locals {
  tokens     = split("/", data.azurerm_lb.kubernetes.frontend_ip_configuration.0.public_ip_address_id)
  last_token = element(local.tokens, length(local.tokens) - 1)
}

data "azurerm_public_ip" "aks_outbound" {
  name                = local.last_token
  resource_group_name = data.azurerm_kubernetes_cluster.main.node_resource_group
}

# In preparation for removing the Firewall, we create a Private DNS Zone and link it to the VNET
# so that we can use a Private Endpoint (created by the module)
resource "azurerm_private_dns_zone" "redis" {
  name                = "privatelink.redis.cache.windows.net"
  resource_group_name = var.env == "uat" ? data.azurerm_resource_group.main.name : data.azurerm_resource_group.chat.name
  tags                = merge(var.tags, { "Environment" = var.env })
}

resource "azurerm_private_dns_zone_virtual_network_link" "redis" {
  name                  = "redis_dns_zone_to_${data.azurerm_virtual_network.aks.name}"
  resource_group_name   = var.env == "uat" ? data.azurerm_resource_group.main.name : data.azurerm_resource_group.chat.name
  private_dns_zone_name = azurerm_private_dns_zone.redis.name
  virtual_network_id    = data.azurerm_virtual_network.aks.id
  tags                  = merge(var.tags, { "Environment" = var.env })
}

# We use Redis for Cookie storage, see https://oauth2-proxy.github.io/oauth2-proxy/docs/configuration/session_storage/#redis-storage
# Nexus Chat also uses it for user session storage
module "redis" {
  source              = "gitlab.com/synechron-code/azure-cache-for-redis/azurerm"
  version             = "0.1.0"
  name                = var.env == "uat" ? "SYNECHRON-OPENAI-REDIS" : "NEXUSCHAT-01-REDIS"
  resource_group_name = var.env == "uat" ? data.azurerm_resource_group.main.name : data.azurerm_resource_group.chat.name
  location            = var.location
  tags                = merge(var.tags, { "Environment" = var.env })
  # TODO we may be able to scale down the Production cluster to Standard
  sku_name                      = var.env == "uat" ? "Standard" : "Premium"
  capacity                      = 1
  enable_private_endpoint       = true
  dns_zone_id                   = azurerm_private_dns_zone.redis.id
  private_endpoint_subnet_id    = data.azurerm_subnet.aks.id
  allowed_cidr                  = ""
  public_network_access_enabled = false
}

# This is not being consumed. The intention was to use it for the oAuth2 Pods and Nexus Chat
# but the oauth2 pods only take an environment variable
# and we never got around to it for Nexus Chat - which should soon be replaced with Entra ID now Redis supports it in GA
# TODO to remove this and replace with Entra ID for Nexus Chat.
resource "azurerm_key_vault_secret" "redis_connection_string" {
  key_vault_id = data.azurerm_key_vault.main.id
  name         = "redis-connection-string"
  value        = module.redis.primary_connection_string
  content_type = "connection-string"
}
