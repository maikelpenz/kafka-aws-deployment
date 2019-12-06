output "rds-endpoint" {
  description = "Plaintext connection host:port pairs"
  value       = "${module.kad-rds.this_db_instance_endpoint}"
}