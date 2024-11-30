variable "helm_resource_ingress_name" {
  type        = string
  description = "Helm resource name"
}

variable "helm_resource_certmgr_name" {
  type        = string
  description = "Helm resource name"
}

variable "helm_resource_extdns_name" {
  type        = string
  description = "Helm resource name"
}

variable "cert_manager_irsa_role_arn" {
  type        = string
  description = "ARN of the IRSA role for cert-manager"
}