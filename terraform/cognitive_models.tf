# CHN
resource "azurerm_cognitive_deployment" "deployments_1" {
  for_each = { for dep in var.deployments["chn"] : dep.name => dep }

  cognitive_account_id = azurerm_cognitive_account.openai_1.id
  name                 = each.value.name
  model {
    format  = each.value.model_format
    name    = each.value.model_name
    version = each.value.model_version
  }
  rai_policy_name = each.value.rai_policy_name
  scale {
    type     = each.value.scale_type
    capacity = each.value.scale_capacity
  }
}

# SWC
resource "azurerm_cognitive_deployment" "deployments_2" {
  for_each = { for dep in var.deployments["swc"] : dep.name => dep }

  cognitive_account_id = azurerm_cognitive_account.openai_2.id
  name                 = each.value.name
  model {
    format  = each.value.model_format
    name    = each.value.model_name
    version = each.value.model_version
  }
  rai_policy_name = each.value.rai_policy_name
  scale {
    type     = each.value.scale_type
    capacity = each.value.scale_capacity
  }
}

# FRC
resource "azurerm_cognitive_deployment" "deployments_3" {
  for_each = { for dep in var.deployments["frc"] : dep.name => dep }

  cognitive_account_id = azurerm_cognitive_account.openai_3.id
  name                 = each.value.name
  model {
    format  = each.value.model_format
    name    = each.value.model_name
    version = each.value.model_version
  }
  rai_policy_name = each.value.rai_policy_name
  scale {
    type     = each.value.scale_type
    capacity = each.value.scale_capacity
  }
}

# UKS - this is where the PTU is
resource "azurerm_cognitive_deployment" "deployments_4" {
  for_each = { for dep in var.deployments["uks"] : dep.name => dep }

  cognitive_account_id = azurerm_cognitive_account.openai_4.id
  name                 = each.value.name
  model {
    format  = each.value.model_format
    name    = each.value.model_name
    version = each.value.model_version
  }
  rai_policy_name = each.value.rai_policy_name
  scale {
    type     = var.env == "prod" ? "Provisioned-Managed" : each.value.scale_type
    capacity = each.value.scale_capacity
  }
}

# East US - EUS
resource "azurerm_cognitive_deployment" "deployments_5" {
  for_each = { for dep in var.deployments["eus"] : dep.name => dep }

  cognitive_account_id = azurerm_cognitive_account.openai_5.id
  name                 = each.value.name
  model {
    format  = each.value.model_format
    name    = each.value.model_name
    version = each.value.model_version
  }
  rai_policy_name = each.value.rai_policy_name
  scale {
    type     = each.value.scale_type
    capacity = each.value.scale_capacity
  }
}
