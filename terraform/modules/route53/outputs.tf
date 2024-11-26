output "route53_name_servers" {
  value = aws_route53_zone.tetris_zone.name_servers
}

output "acm_certificate_arn" {
  value = aws_acm_certificate_validation.tetris_cert_validation.certificate_arn
}