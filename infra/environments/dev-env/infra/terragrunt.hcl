terraform {
  source = "../../..//modules/infra_module"
}

inputs = {
  deployment_account     = "personal-account"
  env                    = "dev"
  vpc_availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_cidr_block         = "172.20.0.0/16"
  vpc_public_subnets     = ["172.20.10.0/24", "172.20.40.0/24"]
  vpc_private_subnets    = ["172.20.20.0/24"]
  vpc_enable_nat_gateway = true
}

include {
  path = find_in_parent_folders()
}
