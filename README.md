# Kubernetes metrcis-server via Terraform

Metrics Server collects resource metrics from Kubelets and exposes them in Kubernetes apiserver through Metrics API for
use by Horizontal Pod Autoscaler and Vertical Pod Autoscaler. Metrics API can also be accessed by kubectl top, making it
easier to debug autoscaling pipelines.

## Installing

```bash
terraform init
terraform apply
```

```bash

```

## See also

* https://github.com/kubernetes-sigs/metrics-server
