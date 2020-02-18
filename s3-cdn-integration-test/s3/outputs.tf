output "bucket_regional_domain_name"{
  value = aws_s3_bucket.site_bucket.bucket_regional_domain_name
  description = "S3 bucket regional domain name"
}