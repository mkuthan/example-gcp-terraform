variable "project_id" {
  type = string
  description = "Project of the function."
}

variable "region" {
  type = string
  description = "Region of the function."
}

variable "source_archive_bucket_name" {
  type = string
  description = "The name of the bucket that contains your zipped function source code."
}

variable "source_archive_bucket_object_name" {
  type = string
  description = "The name of the bucket object that contains your zipped function source code."
}

variable "name" {
  type = string
  description = "A user-defined name of the function. Function names must be unique globally."
}

variable "runtime" {
  type = string
  description = "The runtime in which the function is going to run. "
}
