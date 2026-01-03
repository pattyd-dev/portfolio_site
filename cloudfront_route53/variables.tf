variable "aws_region" {
  description = "Selected AWS Region." # May not be needed if only using global resources.
  type        = string
  default     = "us-east-1"
}

variable "aws_user" {
  description = "Name of AWS account that will be performing the terraform actions."
  type        = string
}

variable "project_name" {
  description = "Used for tagging every created resource consistently."
  type        = string
  default     = "MyProject"
}

variable "domain_name" {
  description = "Name of your domain."
  type        = string
  default     = "example.com"
}

variable "my_zone_id" {
  description = "Route 53 Zone ID."
  type        = string
}
