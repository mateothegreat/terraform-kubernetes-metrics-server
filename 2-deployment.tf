resource "kubernetes_deployment" "metrics-server" {

    wait_for_rollout = false

    metadata {

        name      = var.name
        namespace = var.namespace

    }

    spec {

        replicas = 1

        selector {

            match_labels = {

                app = var.name
            }

        }

        template {

            metadata {

                labels = {

                    app = var.name

                }

            }

            spec {

                service_account_name = var.name
                priority_class_name  = "system-cluster-critical"

                container {

                    name  = "metrics-server"
                    image = var.image

                    args = concat([

                        "--cert-dir=/tmp",
                        "--secure-port=443",
                        "--metric-resolution=${ var.interval}",
                        "--kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname",
                        "--kubelet-use-node-status-port",
                        "--v=${ var.log_level }"

                    ], var.kubelet_insecure_tls ? [ "--kubelet-insecure-tls" ] : [ ])

                    port {

                        container_port = 443
                        name           = "https"
                        protocol       = "TCP"

                    }

                    volume_mount {

                        name       = "tmp-dir"
                        mount_path = "/tmp"

                    }

                    resources {

                        requests = {

                            cpu    = var.requests_cpu
                            memory = var.requests_memory

                        }

                        limits = {

                            cpu    = var.limits_cpu
                            memory = var.limit_memory

                        }

                    }

                    readiness_probe {

                        failure_threshold     = 3
                        initial_delay_seconds = 10
                        timeout_seconds       = 5
                        period_seconds        = 15

                        http_get {

                            path   = "/readyz"
                            port   = "https"
                            scheme = "HTTPS"

                        }

                    }

                    liveness_probe {

                        failure_threshold     = 3
                        initial_delay_seconds = 10
                        timeout_seconds       = 5
                        period_seconds        = 15

                        http_get {

                            path   = "/livez"
                            port   = "https"
                            scheme = "HTTPS"

                        }

                    }

                    security_context {

                        allow_privilege_escalation = false
                        read_only_root_filesystem  = true
                        run_as_non_root            = true
                        run_as_user                = 1000

                    }

                }

                volume {

                    name = "tmp-dir"

                    empty_dir {}

                }

            }

        }

    }

}
