# Switzerland North - CHN
resource "azurerm_cognitive_account" "openai_1" {
  name                  = var.names[var.env]["cognitive_account_1_chn"]
  custom_subdomain_name = lower(var.names[var.env]["cognitive_account_1_chn"])
  location              = "Switzerland North"
  resource_group_name   = var.env == "prod" ? "NEXUSCHAT-RG" : "backstage-rg"
  kind                  = "OpenAI"
  sku_name              = "S0"
  tags                  = merge(var.tags, { "Environment" = var.env })
  network_acls {
    default_action = "Deny"
    virtual_network_rules {
      subnet_id                            = data.azurerm_subnet.aks.id
      ignore_missing_vnet_service_endpoint = false
    }
    # grant access to CTO Vnet in UAT # TODO replace with private endpoint
    dynamic "virtual_network_rules" {
      for_each = var.env == "uat" ? [data.azurerm_subnet.ctochatbot-david[0].id] : []
      content {
        subnet_id                            = data.azurerm_subnet.ctochatbot-david[0].id
        ignore_missing_vnet_service_endpoint = false
      }
    }
  }
}

# Sweden Central - SWC
resource "azurerm_cognitive_account" "openai_2" {
  name                  = var.names[var.env]["cognitive_account_2_swc"]
  custom_subdomain_name = lower(var.names[var.env]["cognitive_account_2_swc"])
  location              = "Sweden Central"
  resource_group_name   = var.env == "prod" ? "NEXUSCHAT-RG" : "backstage-rg"
  kind                  = "OpenAI"
  sku_name              = "S0"
  tags                  = merge(var.tags, { "Environment" = var.env })
  network_acls {
    default_action = "Deny"

    virtual_network_rules {
      subnet_id                            = data.azurerm_subnet.aks.id
      ignore_missing_vnet_service_endpoint = false
    }

    # grant access to CTO Vnet in UAT # TODO replace with private endpoint
    dynamic "virtual_network_rules" {
      for_each = var.env == "uat" ? [data.azurerm_subnet.ctochatbot-david[0].id] : []
      content {
        subnet_id                            = data.azurerm_subnet.ctochatbot-david[0].id
        ignore_missing_vnet_service_endpoint = false
      }
    }
  }
}

# France Central - FRC
resource "azurerm_cognitive_account" "openai_3" {
  name                  = var.names[var.env]["cognitive_account_3_frc"]
  custom_subdomain_name = lower(var.names[var.env]["cognitive_account_3_frc"])
  location              = "France Central"
  resource_group_name   = var.env == "prod" ? "NEXUSCHAT-RG" : "backstage-rg"
  kind                  = "OpenAI"
  sku_name              = "S0"
  tags                  = merge(var.tags, { "Environment" = var.env })
  network_acls {
    default_action = "Deny"

    # TODO find out who these belong to
    ip_rules = var.env == "uat" ? ["167.98.11.196", "91.143.217.131", ] : []

    virtual_network_rules {
      subnet_id                            = data.azurerm_subnet.aks.id
      ignore_missing_vnet_service_endpoint = false
    }

    # grant access to CTO Vnet in UAT # TODO replace with private endpoint
    dynamic "virtual_network_rules" {
      for_each = var.env == "uat" ? [data.azurerm_subnet.ctochatbot-david[0].id] : []
      content {
        subnet_id                            = data.azurerm_subnet.ctochatbot-david[0].id
        ignore_missing_vnet_service_endpoint = false
      }
    }
  }
}

# UK South - UKS
resource "azurerm_cognitive_account" "openai_4" {
  name                  = var.names[var.env]["cognitive_account_4_uks"]
  custom_subdomain_name = lower(var.names[var.env]["cognitive_account_4_uks"])
  location              = "UK South"
  resource_group_name   = var.env == "prod" ? "NEXUSCHAT-RG" : "backstage-rg"
  kind                  = "OpenAI"
  sku_name              = "S0"
  tags                  = merge(var.tags, { "Environment" = var.env })
  network_acls {
    default_action = "Deny"
    ip_rules       = []

    virtual_network_rules {
      subnet_id                            = data.azurerm_subnet.aks.id
      ignore_missing_vnet_service_endpoint = false
    }

  }
}

# EUS
resource "azurerm_cognitive_account" "openai_5" {
  name                  = var.names[var.env]["cognitive_account_5_eus"]
  custom_subdomain_name = lower(var.names[var.env]["cognitive_account_5_eus"])
  location              = "East US"
  resource_group_name   = var.env == "prod" ? "NEXUSCHAT-RG" : "backstage-rg"
  kind                  = "OpenAI"
  sku_name              = "S0"
  tags                  = merge(var.tags, { "Environment" = var.env })
  network_acls {
    default_action = "Deny"
    ip_rules       = []

    virtual_network_rules {
      subnet_id                            = data.azurerm_subnet.aks.id
      ignore_missing_vnet_service_endpoint = false
    }

  }
}
