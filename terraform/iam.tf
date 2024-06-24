resource "azurerm_role_assignment" "automation_sp" {
  count                = var.env == "uat" ? 0 : 1
  principal_id         = data.azurerm_client_config.current.object_id
  scope                = azurerm_cognitive_account.openai_1.id
  role_definition_name = "Cognitive Services User"
}
