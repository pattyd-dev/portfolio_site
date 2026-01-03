output "s3_id" {
  description = "The ID of the site data S3 bucket."
  value       = aws_s3_bucket.site_bucket.id
}

output "s3_arn" {
  description = "The arn of the site data S3 bucket."
  value       = aws_s3_bucket.site_bucket.arn
}