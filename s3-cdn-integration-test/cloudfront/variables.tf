variable "aws_region" {
  description = "AWS region to hosting your resources."
  default     = "ap-southeast-2"
  type        = string
}

variable "app" {
  description = "Name of your app."
  type        = string
}

variable "stage" {
  description = "Stage where app should be deployed like dev, staging or prod."
  default     = "dev"
  type        = string
}

variable "bucket_regional_domain_name" {
  description = "S3 Bucker Regional Domain Name"
  type        = string
}