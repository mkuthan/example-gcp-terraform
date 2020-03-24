provider "google" {
  project = "playground-272019"
}

resource "google_bigquery_dataset" "example_dataset" {
  dataset_id = "example_dataset"
  location = "EU"
}

//
// initial table
//

resource "google_bigquery_table" "example_table" {
  dataset_id = google_bigquery_dataset.example_dataset.dataset_id
  table_id = "example_table"

  schema = file("${path.module}/schema1.json")
}

//
// new optional field (simple type) at the end
//

//resource "google_bigquery_table" "example_table" {
//  dataset_id = google_bigquery_dataset.example_dataset.dataset_id
//  table_id = "example_table"
//
//  schema = file("${path.module}/schema2.json")
//}

//
// column mode relaxed (mandatory -> nullable)
//

//resource "google_bigquery_table" "example_table" {
//  dataset_id = google_bigquery_dataset.example_dataset.dataset_id
//  table_id = "example_table"
//
//  schema = file("${path.module}/schema3.json")
//}


//
// new optional field (complex type) at the end
//

//resource "google_bigquery_table" "example_table" {
//  dataset_id = google_bigquery_dataset.example_dataset.dataset_id
//  table_id = "example_table"
//
//  schema = file("${path.module}/schema4.json")
//}

//
// column description added
//

//resource "google_bigquery_table" "example_table" {
//  dataset_id = google_bigquery_dataset.example_dataset.dataset_id
//  table_id = "example_table"
//
//  schema = file("${path.module}/schema5.json")
//}

//
// column description updated
//

//resource "google_bigquery_table" "example_table" {
//  dataset_id = google_bigquery_dataset.example_dataset.dataset_id
//  table_id = "example_table"
//
//  schema = file("${path.module}/schema6.json")
//}
