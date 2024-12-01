# variable "target_dns_name" {
#   type        = string
#   description = "DNS name of the target service - NGINX Ingress Controller"
# }

variable "cluster_name" {
  default     = "team-delta-cluster"
  type        = string
  description = "EKS cluster name"
}