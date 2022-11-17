variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
  default     = "us-east-1"
}

variable "deployment_account" {
  description = "Deployment Environment"
  type        = string
  default     = "personal-account"
}

variable "env" {
  description = "VPC name"
  type        = string
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR for VPC"
}

variable "vpc_public_subnets" {
  type        = list(string)
  default     = []
  description = "A list all the public subnets in the VPC"
}

variable "vpc_private_subnets" {
  type        = list(string)
  default     = []
  description = "A list all the private subnets in the VPC"
}

variable "vpc_availability_zones" {
  type        = list(string)
  description = "A list of availability zones in the region"
  default     = []
}

variable "vpc_enable_nat_gateway" {
  type        = bool
  default     = false
  description = "Enable/Disable nat gateway in public subnets to enable internet access in private subnet"
}

