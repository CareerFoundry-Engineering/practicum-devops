terraform {
  source = "../../..//environments/dev-env/tfstate"
}

include {
  path = find_in_parent_folders()
}