resource "kubernetes_cluster_role_binding" "metrics-server-auth-reader" {

    metadata {

        name = "metrics-server:system:auth-delegator"

    }

    role_ref {

        api_group = "rbac.authorization.k8s.io"
        kind      = "ClusterRole"
        name      = "system:auth-delegator"

    }

    subject {

        kind      = "ServiceAccount"
        name      = var.name
        namespace = var.namespace

    }

}
resource "kubernetes_cluster_role_binding" "metrics-server" {

    metadata {

        name = "system:metrics-server"

    }

    role_ref {

        api_group = "rbac.authorization.k8s.io"
        kind      = "ClusterRole"
        name      = "system:metrics-server"

    }

    subject {

        kind      = "ServiceAccount"
        name      = var.name
        namespace = var.namespace

    }

}
