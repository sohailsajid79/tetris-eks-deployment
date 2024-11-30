variable "cert_manager_irsa_name" {
  description = "Role name for the cert-manager IRSA role"
  type        = string
}

variable "external_dns_irsa_name" {
  description = "Role name for the external-dns IRSA role"
  type        = string
}

variable "cert_manager_hosted_zone_arns" {
  description = "List of Route53 hosted zone ARNs for cert-manager"
  type        = list(string)
}

variable "external_dns_hosted_zone_arns" {
  description = "List of Route53 hosted zone ARNs for external-dns"
  type        = list(string)
}

variable "oidc_provider_arn" {
  description = "OIDC provider ARN for the EKS cluster"
  type        = string
}