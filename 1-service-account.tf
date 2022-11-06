resource "kubernetes_secret" "metrics-server" {

    metadata {

        name      = var.name
        namespace = var.namespace

    }

}

resource "kubernetes_service_account" "metrics-server" {

    metadata {

        name      = var.name
        namespace = var.namespace

    }

    #    secret {
    #
    #        name = kubernetes_secret.metrics-server.metadata.0.name
    #
    #    }

}

