output "bucket_name" {
  value = module.tfstate.s3_bucket_name
}

output "dynamodb_table_name" {
  value = module.tfstate.dynamodb_table_name
}
