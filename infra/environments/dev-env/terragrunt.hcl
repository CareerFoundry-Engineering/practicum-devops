locals {
  aws_region  = "us-east-1"
  aws_profile = "personal-account"
  env         = "dev"
}

inputs = {
  env                = local.env
  deployment_account = "personal-${local.env}"
}

remote_state {
  backend                         = "s3"
  disable_dependency_optimization = true
  generate = {
    path      = "terraform_remote_backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "${local.aws_profile}-terraform-state"
    key            = "${path_relative_to_include()}/${local.env}/terraform.tfstate"
    region         = local.aws_region
    dynamodb_table = "${local.aws_profile}-state-locks"
    encrypt        = true
    profile        = local.aws_profile
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region  = "${local.aws_region}"
  default_tags {
    tags = {
      provisioner 	    = "terragrunt"
      env         	    = "${local.env}"
      github-repository = "exp-infra"
    }
  }
}
EOF
}

generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_version = "= 1.1.5"
  required_providers {
    aws = {
      version = "= 4.24.0",
      source = "hashicorp/aws"
    }
  }
}
EOF
}
