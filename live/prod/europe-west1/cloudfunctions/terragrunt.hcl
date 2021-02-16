locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  project = local.account_vars.locals.project
  region = local.region_vars.locals.region
  environment = local.environment_vars.locals.environment
}

terraform {
  source = "../../../..//modules/cloudfunctions"
}

include {
  path = find_in_parent_folders()
}

dependency "cloud_storage" {
  config_path = "${get_parent_terragrunt_dir()}/prod/europe-west1/gcs"
}

inputs = {
  project_id = "${local.project}"
  region = "${local.region}"

  name = "${local.project}-foo-${local.environment}-${local.region}"
  runtime = "node10"

  source_archive_bucket_name = dependency.cloud_storage.outputs.bucket.name
  source_archive_bucket_object_name = "foo"
}