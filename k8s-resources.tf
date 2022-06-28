# User service database password secret
resource "kubernetes_secret" "outputs" {
  metadata {
    name      = "tf-outputs"
    namespace = local.namespace
  }

  data = {
    username = var.master_username
    password = random_password.db_password.result
    hostname = module.db_cluster.rds_cluster_endpoint
    db_port  = module.db_cluster.rds_cluster_port
    db_name  = module.db_cluster.rds_cluster_database_name
  }
}

# resource "kubernetes_service_account" "microgateway-service-account" {
#   metadata {
#     name      = var.service_account_name
#     namespace = var.namespace
#     annotations = {
#       "eks.amazonaws.com/role-arn" = aws_iam_role.service_account.arn
#     }
#   }
# }


# resource "kubernetes_annotations" "application-service-account" {
#   api_version = "v1"
#   kind        = "ServiceAccount"
#   metadata {
#     name      = var.service_account_name
#     namespace = var.namespace
#   }
# }

# resource "kubernetes_annotations" "microgateway-firehose-sa" {
#   api_version = "v1"
#   kind        = "ServiceAccount"
#   metadata {
#     name      = var.service_account_microgateway_name
#     namespace = var.namespace
#   }
#   annotations = {
#     "eks.amazonaws.com/role-arn" = aws_iam_role.microgateway_service_account.arn
#   }
# }
