output "repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.js_app.repository_url
}