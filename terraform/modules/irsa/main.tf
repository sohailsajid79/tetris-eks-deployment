module "cert_manager_irsa" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version                       = "5.2.0"
  role_name                     = var.cert_manager_irsa_name
  attach_cert_manager_policy    = true
  cert_manager_hosted_zone_arns = var.cert_manager_hosted_zone_arns

  oidc_providers = {
    eks = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = ["cert-manager:cert-manager"]
    }
  }
}

module "external_dns_irsa" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version                       = "5.2.0"
  role_name                     = var.external_dns_irsa_name
  attach_external_dns_policy    = true
  external_dns_hosted_zone_arns = var.external_dns_hosted_zone_arns

  oidc_providers = {
    eks = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = ["external-dns:external-dns"]
    }
  }
}