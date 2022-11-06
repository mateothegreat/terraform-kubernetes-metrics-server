variable "name" {

    type        = string
    default     = "metrics-server"
    description = "Name of the metrics-server resources created."

}

variable "namespace" {

    type        = string
    default     = "kube-system"
    description = "Namespace to deploy the metrics-server."

}

variable "image" {

    type        = string
    default     = "k8s.gcr.io/metrics-server/metrics-server:v0.6.1"
    description = "Metrics server image."

}

variable "interval" {

    type        = string
    default     = "10s"
    description = "Interval at which metrics should be scraped. Default is '10s'."

}

variable "kubelet_insecure_tls" {

    type        = bool
    default     = true
    description = "Use insecure connection to connect to kubelet. Default is 'true'."

}

variable "requests_cpu" {

    type        = string
    default     = "100m"
    description = "CPU request for the metrics-server container."

}

variable "requests_memory" {

    type        = string
    default     = "200Mi"
    description = "Memory request for the metrics-server container."

}

variable "limits_cpu" {

    type        = string
    default     = "100m"
    description = "CPU limit for the metrics-server container."

}

variable "limit_memory" {

    type        = string
    default     = "200Mi"
    description = "Memory limit for the metrics-server container."

}

variable "log_level" {

    type        = number
    default     = 1
    description = "Log level for the metrics-server container. Default is '1'."

}
