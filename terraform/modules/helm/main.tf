module "nginx-controller" {
  source           = "terraform-iaac/nginx-controller/helm"
  name             = var.helm_resource_ingress_name
  namespace        = var.helm_resource_ingress_name
  timeout          = 600
  additional_set = [
    {
      name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
      value = "nlb"
      type  = "string"
    },
    {
      name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-cross-zone-load-balancing-enabled"
      value = "true"
      type  = "string"
    }
  ]
}

resource "helm_release" "cert_manager" {
  name             = var.helm_resource_certmgr_name
  repository       = "https://charts.jetstack.io"
  create_namespace = true
  chart            = var.helm_resource_certmgr_name
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
  chart            = var.helm_resource_extdns_name
  namespace        = var.helm_resource_extdns_name

  set {
    name  = "wait-for"
    value = var.cert_manager_irsa_role_arn
  }

  values = [
    file("${path.module}/helm-values/external-dns.yaml")
  ]
}

# resource "helm_release" "argocd_deploy" {
#   name             = "argocd"
#   repository       = "https://argoproj.github.io/argo-helm"
#   chart            = "argo-cd"
#   timeout          = "600"
#   namespace        = "argo-cd"
#   create_namespace = true

#   values = [
#     file("helm-values/argocdconfig.yaml")
#   ]
# } 