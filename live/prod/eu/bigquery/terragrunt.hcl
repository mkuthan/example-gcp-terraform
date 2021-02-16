locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  project = local.account_vars.locals.project
  region = local.region_vars.locals.region
  environment = local.environment_vars.locals.environment
}

terraform {
  source = "github.com/terraform-google-modules/terraform-google-bigquery.git?ref=v4.4.0"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  project_id = "${local.project}"
  location = "${local.region}"

  dataset_id = "example-gcp-terraform-${local.environment}-${local.region}"
  dataset_name = "example-gcp-terraform-${local.environment}-${local.region}"
  description = "Example dataset managed by TF/TG"

  tables = [
    {
      table_id = "foo",
      schema = "foo_schema.json",
      expiration_time = null,
      time_partitioning = {
        type = "DAY",
        field = "TIMESTAMP",
        require_partition_filter = true,
        expiration_ms = null,
      },
      clustering = [
        "id",
        "foo_name"],
      labels = {
        environment = "${local.environment}",
      },
    },
  ]
}