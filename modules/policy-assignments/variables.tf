data "azurerm_subscription" "current" {
}

variable "monitoring_governance_policyset_id" {
  type        = string
  description = "The policy set definition id for monitoring_governance"
}
variable "data_protection_governance_policyset_id" {
  type        = string
  description = "The policy set definition id for data_protection_governance"
}

variable "logging_governance_policyset_id" {
  type        = string
  description = "The policy set definition id for logging_governance"
}