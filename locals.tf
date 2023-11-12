locals {
  file_name = split("/", var.source_file)[length(split("/", var.source_file)) - 1]
  handler   = "${split(".", local.file_name)[0]}.lambda_handler"
}
