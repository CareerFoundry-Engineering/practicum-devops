variable "vpc_id" {
  description = "VPC ID in which the instance is to be created"
  type        = string
}

variable "instance_subnet_id" {
  description = "ID of the subnet in which instance is to be kept"
  type        = string
}

variable "name_prefix" {
  description = "Name prefix for the instance"
  type        = string
}

variable "user_data" {
  description = "User Data for EC2 Instance"
  type        = string
  default     = ""
}

variable "deployment_account" {
  description = "Deployment Environment"
  type        = string
}

variable "env" {
  description = "VPC name"
  type        = string
}
