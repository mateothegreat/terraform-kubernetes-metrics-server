# Kubernetes metrcis-server via Terraform

Metrics Server collects resource metrics from Kubelets and exposes them in Kubernetes apiserver through Metrics API for
use by Horizontal Pod Autoscaler and Vertical Pod Autoscaler. Metrics API can also be accessed by kubectl top, making it
easier to debug autoscaling pipelines.

## Usage

```hcl
provider "kubernetes" {

    config_path = "~/.kube/config"

}

module "metrics-server" {

    source  = "mateothegreat/metrics-server/kubernetes"
    version = "0.0.1"

    name      = "metrics-server"
    namespace = "kube-system"

}
```

## See also

* https://github.com/kubernetes-sigs/metrics-server
