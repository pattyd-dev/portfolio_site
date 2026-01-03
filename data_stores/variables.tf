variable "aws_region" {
    description = "Selected AWS Region." # May not be needed if only using global resources.
    type = string
    default = "us-east-1"
}

variable "aws_user" {
    description = "Name of AWS account that will be performing the terraform actions."
    type = string
}

variable "project_name" {
    description = "Used for tagging every created resource consistently."
    type = string
    default = "MyProject"
}

variable "site_bucket_name" {
    description = "Name of S3 bucket that will contain website content."
    type = string
}

variable "website_root" {
  description = "The path to the local website root directory"
  type = string
  default     = "./static-website-content"
}