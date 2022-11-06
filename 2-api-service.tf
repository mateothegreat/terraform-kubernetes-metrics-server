resource "kubernetes_api_service" "metrics-server" {

    metadata {

        name = "v1beta1.metrics.k8s.io"

        labels = {

            app = var.name

        }

    }

    spec {

        version                  = "v1beta1"
        version_priority         = 100
        group                    = "metrics.k8s.io"
        group_priority_minimum   = 100
        insecure_skip_tls_verify = true

        service {

            name      = kubernetes_service.metrics-server.metadata[ 0 ].name
            namespace = kubernetes_service.metrics-server.metadata[ 0 ].namespace

        }

    }

}
