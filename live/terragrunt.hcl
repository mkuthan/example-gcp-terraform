locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  project = local.account_vars.locals.project
  region = local.region_vars.locals.region
  environment = local.environment_vars.locals.environment
}

remote_state {
  backend = "gcs"
  generate = {
    path = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket = "${local.project}-${get_env("TF_STATE_BUCKET_SUFFIX", "tf-state")}"
    prefix = "${path_relative_to_include()}"
    project = "${local.project}"
    location = "${get_env("TF_STATE_BUCKET_LOCATION", "US")}"
  }
}

inputs = merge(
local.account_vars.locals,
local.region_vars.locals,
local.environment_vars.locals,
)
