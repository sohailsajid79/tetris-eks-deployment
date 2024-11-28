variable "role_name" {
  type        = string
  description = "EKS Cluster Role Name"
}

variable "cni_policy_arn" {
  type        = string
  description = "ARN of the custom CNI policy for Kubernetes networking"
}