# Kubernetes metrcis-server via Terraform

Metrics Server collects resource metrics from Kubelets and exposes them in Kubernetes apiserver through Metrics API for
use by Horizontal Pod Autoscaler and Vertical Pod Autoscaler. Metrics API can also be accessed by kubectl top, making it
easier to debug autoscaling pipelines.

> https://registry.terraform.io/modules/mateothegreat/metrics-server/kubernetes/latest

## Usage

```hcl
provider "kubernetes" {

    config_path = "~/.kube/config"

}

module "metrics-server" {

    source  = "mateothegreat/metrics-server/kubernetes"
    version = "0.0.2"

    name      = "metrics-server"
    namespace = "kube-system"

}
```

## See also

* https://matthewdavis.io
* https://registry.terraform.io/modules/mateothegreat/metrics-server/kubernetes/latest
* https://github.com/kubernetes-sigs/metrics-server

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_api_service.metrics-server](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/api_service) | resource |
| [kubernetes_cluster_role.metrics-server](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role.metrics-server-aggregated](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.metrics-server](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_cluster_role_binding.metrics-server-auth-reader](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_deployment.metrics-server](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_role_binding.metrics-server](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding) | resource |
| [kubernetes_secret.metrics-server](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_service.metrics-server](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [kubernetes_service_account.metrics-server](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image"></a> [image](#input\_image) | Metrics server image. | `string` | `"k8s.gcr.io/metrics-server/metrics-server:v0.6.1"` | no |
| <a name="input_interval"></a> [interval](#input\_interval) | Interval at which metrics should be scraped. Default is '10s'. | `string` | `"10s"` | no |
| <a name="input_kubelet_insecure_tls"></a> [kubelet\_insecure\_tls](#input\_kubelet\_insecure\_tls) | Use insecure connection to connect to kubelet. Default is 'true'. | `bool` | `true` | no |
| <a name="input_limit_memory"></a> [limit\_memory](#input\_limit\_memory) | Memory limit for the metrics-server container. | `string` | `"200Mi"` | no |
| <a name="input_limits_cpu"></a> [limits\_cpu](#input\_limits\_cpu) | CPU limit for the metrics-server container. | `string` | `"100m"` | no |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | Log level for the metrics-server container. Default is '1'. | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the metrics-server resources created. | `string` | `"metrics-server"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace to deploy the metrics-server. | `string` | `"kube-system"` | no |
| <a name="input_requests_cpu"></a> [requests\_cpu](#input\_requests\_cpu) | CPU request for the metrics-server container. | `string` | `"100m"` | no |
| <a name="input_requests_memory"></a> [requests\_memory](#input\_requests\_memory) | Memory request for the metrics-server container. | `string` | `"200Mi"` | no |

## Outputs

No outputs.
