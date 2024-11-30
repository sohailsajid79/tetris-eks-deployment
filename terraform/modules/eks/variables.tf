variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version EKS cluster"
}

variable "vpc_id" {
  type        = string
  description = "EKS cluster VPC ID for deployment"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnets for EKS cluster"
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnets for EKS cluster"
}

variable "iam_role_name" {
  type        = string
  description = "IAM role name for EKS cluster"
}

variable "node_desired_size" {
  type        = number
  description = "Desired number of worker nodes"
}

variable "node_min_size" {
  type        = number
  description = "Minimum number of worker nodes"
}

variable "node_max_size" {
  type        = number
  description = "Maximum number of worker nodes"
}
