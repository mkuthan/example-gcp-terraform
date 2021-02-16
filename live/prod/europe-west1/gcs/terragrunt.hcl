locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  project = local.account_vars.locals.project
  region = local.region_vars.locals.region
  environment = local.environment_vars.locals.environment
}

terraform {
  source = "github.com/terraform-google-modules/terraform-google-cloud-storage.git?ref=v1.7.2"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  project_id = "${local.project}"
  location = "${local.region}"

  names = [
    "functions"
  ]
  prefix = "${local.project}"

  storage_class = "REGIONAL"
}