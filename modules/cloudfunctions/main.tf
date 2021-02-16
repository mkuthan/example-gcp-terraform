data "google_storage_bucket_object" "source_archive_bucket_object" {
  bucket = var.source_archive_bucket_name
  name = var.source_archive_bucket_object_name
}

resource "google_cloudfunctions_function" "function" {
  project_id = var.project_id
  region = var.region

  name = var.name
  runtime = var.runtime

  source_archive_bucket = data.google_storage_bucket_object.source_archive_bucket_object.bucket
  source_archive_object = data.google_storage_bucket_object.source_archive_bucket_object.name
}
