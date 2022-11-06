resource "kubernetes_cluster_role" "metrics-server-aggregated" {

    metadata {

        name = "system:aggregated-metrics-reader"

        labels = {

            "rbac.authorization.k8s.io/aggregate-to-admin" = "true"
            "rbac.authorization.k8s.io/aggregate-to-edit"  = "true"
            "rbac.authorization.k8s.io/aggregate-to-view"  = "true"

        }
    }

    rule {

        api_groups = [ "metrics.k8s.io" ]
        resources  = [ "pods", "nodes" ]
        verbs      = [ "get", "list", "watch" ]

    }

}
resource "kubernetes_cluster_role" "metrics-server" {

    metadata {

        name = "system:metrics-server"

    }

    rule {

        api_groups = [ "" ]
        resources  = [ "nodes/metrics" ]
        verbs      = [ "get" ]

    }

    rule {

        api_groups = [ "" ]
        resources  = [ "pods", "nodes" ]
        verbs      = [ "get", "list", "watch" ]

    }

}
