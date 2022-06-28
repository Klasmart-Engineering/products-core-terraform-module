# database outputs
output "db_output_secret" {
  description = "The Kubernetes secret containing all terraform output"
  value       = "tf-outputs"
}

output "db_password" {
  description = "The database master password"
  value       = random_password.db_password.result
  sensitive = true
}

output "db_username" {
  description = "The database master username"
  value       = var.master_username
}

output "db_hostname" {
  description = "The database hostname"
  value       = module.db_cluster.rds_cluster_endpoint
}

output "db_port" {
  description = "The database port"
  value       = module.db_cluster.rds_cluster_port
}

output "db_name" {
  description = "The logical database name"
  value       = module.db_cluster.rds_cluster_database_name
}
