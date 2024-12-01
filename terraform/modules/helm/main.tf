resource "helm_release" "nginx" {
  create_namespace = true
  name             = var.helm_resource_ingress_name
  namespace        = var.helm_resource_ingress_name
  chart            = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  timeout          = 600
}

resource "helm_release" "cert_manager" {
  name             = var.helm_resource_certmgr_name
  repository       = "https://charts.jetstack.io"
  create_namespace = true
  chart            = "cert-manager"
  namespace        = var.helm_resource_certmgr_name

  set {
    name  = "installCRDs"
    value = "true"
  }

  values = [
    file("${path.module}/helm-values/cert-manager.yaml")
  ]
}

resource "helm_release" "external_dns" {
  name             = var.helm_resource_extdns_name
  repository       = "oci://registry-1.docker.io/bitnamicharts"
  create_namespace = true
  chart            = "external-dns"
  namespace        = var.helm_resource_extdns_name

  set {
    name  = "serviceAccount.annotations.eks.amazonaws.com/role-arn"
    value = var.external_dns_irsa_role_arn
  }

  values = [
    file("${path.module}/helm-values/external-dns.yaml")
  ]
}