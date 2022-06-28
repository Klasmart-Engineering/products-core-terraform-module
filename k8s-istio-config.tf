resource "kubernetes_manifest" "db-istio-egress-service-entry" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1beta1"
    "kind"       = "ServiceEntry"
    "metadata" = {
      "name"      = "products-db"
      "namespace" = "istio-system"
    }
    "spec" = {
      "hosts" = [
        module.db_cluster.rds_cluster_endpoint,
      ]
      "location" = "MESH_EXTERNAL"
      "ports" = [
        {
          "name"     = "postgresql",
          "number"   = module.db_cluster.rds_cluster_port
          "protocol" = "TCP"
        }
      ]
      "resolution" = "DNS"
    }
  }
}

# resource "kubernetes_manifest" "firehose-istio-egress-service-entry" {
#   manifest = {
#     "apiVersion" = "networking.istio.io/v1beta1"
#     "kind"       = "ServiceEntry"
#     "metadata" = {
#       "name"      = "api-usage-firehose"
#       "namespace" = "istio-system"
#     }
#     "spec" = {
#       "hosts" = [
#         "firehose.${var.region}.amazonaws.com",
#       ]
#       "location" = "MESH_EXTERNAL"
#       "ports" = [
#         {
#           "name"     = "https",
#           "number"   = 443
#           "protocol" = "TLS"
#         }
#       ]
#       "resolution" = "DNS"
#     }
#   }
# }

# resource "kubernetes_manifest" "kidsloop_net-egress-service-entry" {
#   manifest = {
#     "apiVersion" = "networking.istio.io/v1beta1"
#     "kind"       = "ServiceEntry"
#     "metadata" = {
#       "name"      = "kidsloop-net"
#       "namespace" = "istio-system"
#     }
#     "spec" = {
#       "hosts" = [
#         "kidsloop.net",
#       ]
#       "location" = "MESH_EXTERNAL"
#       "ports" = [
#         {
#           "name"     = "https",
#           "number"   = 443
#           "protocol" = "TLS"
#         }
#       ]
#       "resolution" = "DNS"
#     }
#   }
# }