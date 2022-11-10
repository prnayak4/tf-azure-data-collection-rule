resource "azurerm_subscription_policy_assignment" "monitoring_governance" {
  name                 = "monitoring_governance"
  subscription_id      = data.azurerm_subscription.current.id
  policy_definition_id = var.monitoring_governance_policyset_id
  description          = "Assignment of the Monitoring Governance initiative to subscription."
  display_name         = "Monitoring Governance"
  location             = "eastus"
  identity { type = "SystemAssigned" }
}


resource "azurerm_subscription_policy_assignment" "data_protection_governance" {
  name                 = "data_protection_governance"
  subscription_id      = data.azurerm_subscription.current.id
  policy_definition_id = var.data_protection_governance_policyset_id
  description          = "Assignment of the Data Protection Governance initiative to subscription."
  display_name         = "Data Protection Governance"
}

resource "azurerm_subscription_policy_assignment" "logging_governance" {
  name                 = "logging_governance"
  subscription_id      = data.azurerm_subscription.current.id
  policy_definition_id = var.logging_governance_policyset_id
  description          = "Assignment of the Logging Governance initiative to subscription."
  display_name         = "Logging Governance"
  location             = "eastus"
  identity { type = "SystemAssigned" }
}