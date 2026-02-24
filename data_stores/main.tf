resource "aws_s3_bucket" "site_bucket" {
  bucket = var.site_bucket_name

  tags = {
    Project = "${var.project_name}"
    Environment = "Development"
  }
}

# Enable versioning on bucket. Future proofing for CI/CD implementation.
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.site_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Copy files from var.website_root into the newly created S3 bucket.
resource "aws_s3_object" "website_files" {
  
  for_each = fileset(var.website_root, "**") 

  bucket = aws_s3_bucket.site_bucket.id
  key    = each.value 

  source = "${var.website_root}/${each.value}"
  etag   = filemd5("${var.website_root}/${each.value}") # Allows utilization of S3's versioning.

  # Dynamically set the content type based on the file extension.
  content_type = lookup(local.mime_types, regex("\\.([^.]+)$", each.value)[0], "application/octet-stream")
}

# Local map for common MIME types.
locals {
  mime_types = {
    "html" = "text/html"
    "css"  = "text/css"
    "js"   = "application/javascript"
    "png"  = "image/png"
    "jpg"  = "image/jpeg"
    "svg"  = "image/svg+xml"
  }
}


