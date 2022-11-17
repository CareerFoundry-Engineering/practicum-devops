variable "aws_region" {
  description = "AWS Region for develop infra"
  default     = "us-east-1"
}

variable "deployment_account" {
  description = "Deployment Environment"
}

variable "aws_profile" {
  description = "AWS creds profile on your local machine"
}
