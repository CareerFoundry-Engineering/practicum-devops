variable "aws_region" {
  description = "AWS Region for Infra"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Credentials Profile on your local machine"
  default     = "personal-account"
}

variable "deployment_account" {
  description = "Deployment Environment"
  default     = "personal-account"
}
