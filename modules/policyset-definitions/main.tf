resource "azurerm_policy_set_definition" "monitoring_governance" {

  name         = "monitoring_governance"
  policy_type  = "Custom"
  display_name = "Monitoring Governance"
  description  = "Contains common Monitoring Governance policies"

  metadata = jsonencode(
    {
      "category" : "${var.policyset_definition_category}"
    }
  )

  dynamic "policy_definition_reference" {
    for_each = var.custom_policies_monitoring_governance
    content {
      policy_definition_id = policy_definition_reference.value["policyID"]
      reference_id         = policy_definition_reference.value["policyID"]
    }
  }
}


resource "azurerm_policy_set_definition" "data_protection_governance" {

  name         = "data_protection_governance"
  policy_type  = "Custom"
  display_name = "Data Protection Governance"
  description  = "Contains common Data Protection Governance policies"

  metadata = jsonencode(
    {
      "category" : "${var.policyset_definition_category}"
    }

  )

  dynamic "policy_definition_reference" {
    for_each = data.azurerm_policy_definition.builtin_policies_data_protection_governance
    content {
      policy_definition_id = policy_definition_reference.value["id"]
      reference_id         = policy_definition_reference.value["display_name"]
    }
  }
}

resource "azurerm_policy_set_definition" "logging_governance" {

  name         = "logging_governance"
  policy_type  = "Custom"
  display_name = "Logging Governance"
  description  = "Contains common Logging Governance policies"

  metadata = jsonencode(
    {
      "category" : "${var.policyset_definition_category}"
    }

  )

  dynamic "policy_definition_reference" {
    for_each = data.azurerm_policy_definition.builtin_policies_logging_governance
    content {
      policy_definition_id = policy_definition_reference.value["id"]
      reference_id         = policy_definition_reference.value["display_name"]
      parameter_values = jsonencode(
        {
          "logAnalytics" : { value = var.log_analytics_id }
        }
      )
    }
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a4034bc6-ae50-406d-bf76-50f4ee5a7811"
    reference_id         = "Configure Linux virtual machines with Azure Monitor Agent"
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/2ea82cdd-f2e8-4500-af75-67a2e084ca74"
    reference_id         = "(linuxSecurityLogs)Configure Association to link Linux virtual machines to Data Collection Rule"
    parameter_values = jsonencode(
      {
        "dcrResourceId" : { value = "/subscriptions/343c17eb-34b6-4481-92a2-a0a5a04bdd88/resourceGroups/DataCollectionRules/providers/Microsoft.Insights/dataCollectionRules/linuxSecurityLogs" }
      }
    )
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/2ea82cdd-f2e8-4500-af75-67a2e084ca74"
    reference_id         = "(linuxPerformanceLogs)Configure Association to link Linux virtual machines to Data Collection Rule"
    parameter_values = jsonencode(
      {
        "dcrResourceId" : { value = "/subscriptions/343c17eb-34b6-4481-92a2-a0a5a04bdd88/resourceGroups/DataCollectionRules/providers/Microsoft.Insights/dataCollectionRules/linuxPerformanceLogs" }
      }
    )
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/ca817e41-e85a-4783-bc7f-dc532d36235e"
    reference_id         = "Configure Windows virtual machines with Azure Monitor Agent"
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/eab1f514-22e3-42e3-9a1f-e1dc9199355c"
    reference_id         = "(windowsSecurityLogs)Configure Association to link Windows virtual machines to Data Collection Rule"
    parameter_values = jsonencode(
      {
        "dcrResourceId" : { value = "/subscriptions/343c17eb-34b6-4481-92a2-a0a5a04bdd88/resourceGroups/DataCollectionRules/providers/Microsoft.Insights/dataCollectionRules/windowsSecurityLogs" }
      }
    )
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/eab1f514-22e3-42e3-9a1f-e1dc9199355c"
    reference_id         = "(windowsPerformanceLogs)Configure Association to link Windows virtual machines to Data Collection Rule"
    parameter_values = jsonencode(
      {
        "dcrResourceId" : { value = "/subscriptions/343c17eb-34b6-4481-92a2-a0a5a04bdd88/resourceGroups/DataCollectionRules/providers/Microsoft.Insights/dataCollectionRules/windowsPerformanceLogs" }
      }
    )
  }

}