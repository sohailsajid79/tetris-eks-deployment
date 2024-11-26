variable "zone_name" {
  type        = string
  description = "Route53 zone name"
}

variable "cname_record_name" {
  type        = string
  description = "DNS subdomain record"
}

variable "target_dns_name" {
  type        = string
  description = "DNS name of the target service (NGINX Ingress Controller)"
}
