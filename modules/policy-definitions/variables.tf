 
variable "policy_definition_category" {
  type        = string
  description = "The category to use for all Policy Definitions"
  default     = "Custom"
}

variable "azure_monitor_action_group_name" {
  type        = string
  description = "The name of the Azure Monitor Action Group"
  default     = "AlertOperationsGroup"
}

variable "azure_monitor_action_group_rg_name" {
  type        = string
  description = "Resource Group containing the Azure Monitor Action Group"
  default     = "AzMonitorAlertGroups"
}