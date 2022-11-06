resource "kubernetes_service" "metrics-server" {

    metadata {

        name      = var.name
        namespace = var.namespace

    }

    spec {

        type = "ClusterIP"

        selector = {

            app = var.name

        }

        port {

            port        = 443
            target_port = 443
            protocol    = "TCP"

        }

    }

}
