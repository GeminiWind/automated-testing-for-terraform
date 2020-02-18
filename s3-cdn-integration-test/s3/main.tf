provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "site_bucket"  {
  bucket = "${var.app}-site-bucket--stage-${var.stage}"

  acl    = "public-read"

  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjects",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.app}-site-bucket--stage-${var.stage}/*"
    }
  ]
}
EOF

  tags = {
    APP = "${var.app}"
    STAGE = "${var.stage}"
  }

  versioning {
    enabled = var.enable_versioning
  }

  website {
    index_document = "${var.index_page}"
    error_document = "${var.error_page}"
  }
}

# Sync artifact to s3 bucket
resource "null_resource" "upload_web_resouce" {
  provisioner  "local-exec" {
    command = "aws s3 sync ${var.artifact_dir} s3://${var.app}-site-bucket--stage-${var.stage}"
  }

  depends_on = ["aws_s3_bucket.site_bucket"]
}