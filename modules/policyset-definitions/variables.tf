variable "log_analytics_id" {
  type        = string
  description = "Resource ID for the OMS workspace - used for log governance policies"
  default     = "/subscriptions/343c17eb-34b6-4481-92a2-a0a5a04bdd88/resourcegroups/azrdefndrresgrp/providers/microsoft.operationalinsights/workspaces/log-devtestautomation-eastus-001"
}

variable "policyset_definition_category" {
  type        = string
  description = "The category to use for all PolicySet defintions"
  default     = "Custom"
}

variable "custom_policies_monitoring_governance" {
  type        = list(map(string))
  description = "List of custom policy definitions for the monitoring_governance policyset"
  default     = []
}
 
 

variable "custom_policies_logging_governance" {
  type        = list(map(string))
  description = "List of custom policy definitions for the logging_governance policyset"
  default     = []
}
 
variable "builtin_policies_data_protection_governance" {
  type        = list(any)
  description = "List of policy definitions (display names) for the data_protection_governance policyset"
  default = [
    "Azure Backup should be enabled for Virtual Machines",
    "Long-term geo-redundant backup should be enabled for Azure SQL Databases",
    "Audit virtual machines without disaster recovery configured",
    "Key vaults should have purge protection enabled",
    "Key vaults should have soft delete enabled"
  ]
}

variable "builtin_policies_logging_governance" {
  type        = list(any)
  description = "List of policy definitions (display names) for the logging_governance policyset"
  default = [
    "Deploy - Configure diagnostic settings for Azure Key Vault to Log Analytics workspace",
    "Configure diagnostic settings for Storage Accounts to Log Analytics workspace",
    "Deploy - Configure diagnostic settings for Azure Kubernetes Service to Log Analytics workspace",
    "Deploy - Configure diagnostic settings for SQL Databases to Log Analytics workspace"
  ]
}

 
data "azurerm_policy_definition" "builtin_policies_data_protection_governance" {
  count        = length(var.builtin_policies_data_protection_governance)
  display_name = var.builtin_policies_data_protection_governance[count.index]
}

data "azurerm_policy_definition" "builtin_policies_logging_governance" {
  count        = length(var.builtin_policies_logging_governance)
  display_name = var.builtin_policies_logging_governance[count.index]
}
