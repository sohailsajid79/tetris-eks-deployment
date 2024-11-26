resource "aws_route53_zone" "tetris_zone" {
  name = var.zone_name
}

resource "aws_route53_record" "tetris_record" {
  zone_id = aws_route53_zone.tetris_zone.zone_id
  name    = var.cname_record_name
  type    = "CNAME"

  records = [var.target_dns_name]
  ttl     = 300
}

resource "aws_acm_certificate" "tetris_cert" {
  domain_name       = var.cname_record_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "tetris_cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.tetris_cert.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  }

  zone_id = aws_route53_zone.tetris_zone.zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.value]
  ttl     = 300
}

resource "aws_acm_certificate_validation" "tetris_cert_validation" {
  certificate_arn         = aws_acm_certificate.tetris_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.tetris_cert_validation : record.fqdn]
}