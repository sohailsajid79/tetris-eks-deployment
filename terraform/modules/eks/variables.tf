variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "eks_cluster_role" {
  type        = string
  description = "EKS Cluster Role ARN"
}

variable "private_subnets" {
  type        = list(string)
  description = "EKS Private Subnets"
}

variable "eks_node_role" {
  type        = string
  description = "EKS node group ARN"
}

variable "node_desired_size" {
  description = "Desired size of node group"
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum size of node group"
  type        = number
  default     = 5
}

variable "node_min_size" {
  description = "Minimum size of node group"
  type        = number
  default     = 1
}

variable "max_unavailable" {
  description = "Minimum size of node group"
  type        = number
  default     = 1
}
