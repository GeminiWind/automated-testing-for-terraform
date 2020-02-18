
# ---------------------------------------------------------------------------------------------------------------------
# AWS Provider Configuration
# ---------------------------------------------------------------------------------------------------------------------
variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "ap-southeast-2"
}

variable "image_id" {
  description = "The EC2 image ID to launch."
  type        = string
  default     = "ami-02a599eb01e3b3c5b"
}

variable "instance_type" {
  description = "EC2 instance type to be lauched. For e.g: t2.micro."
  default     = "t2.micro"
}
