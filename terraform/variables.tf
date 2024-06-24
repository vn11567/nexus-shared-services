variable "tags" {
  type        = map(string)
  description = <<-EOF
  Map of tags to apply to each resource.
  EOF
  default = {
    "terraform" : "nexus-shared-services"
    "Client" : ""
    "BU" : "UK"
    "Owner" : ""
    "App" : ""
    "Contact1" : ""
    "Contact2" : ""
    "Contact3" : ""
  }
}
variable "env" {
  type        = string
  description = "Environment to deploy to - uat or prod"
  validation {
    condition     = contains(["uat", "prod"], var.env)
    error_message = "Environment must be one of 'uat' or 'prod'"
  }
}

variable "deployments" {
  description = "A map of openai deployments to create"
  type = map(list(object({
    name            = string
    model_format    = string
    model_name      = string
    model_version   = string
    rai_policy_name = string
    scale_type      = string
    scale_capacity  = number
  })))
}

variable "names" {
  type        = map(map(string))
  description = "Names of the resources we'll build in UAT/Prod - because of legacy they're slightly different."
}

# Auth
variable "subscription_id" {
  type        = string
  description = "The Subscription in which the resources will be created."
}

variable "client_id" {
  type        = string
  description = "The client id of the service principal to use for authentication."
}

variable "client_secret" {
  description = "The client secret of the service principal to use for authentication."
  type        = string
}

variable "location" {
  type        = string
  default     = "UK South"
  description = "The Azure region to deploy resources"
}

variable "gitlab_ai_group_token" {
  type        = string
  description = "Token with which we will create a Gitlab Runner in the AI Group"
}

## Neither of these are currently accessible by the Service Principal we use for automation (it has no Entra access)
#variable "oauth2_proxy_client_secret_beta" {
#  type        = string
#  description = "Client Secret for Entra Enterprise app used for authentication - beta app"
#}
