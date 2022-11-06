provider "kubernetes" {

    config_path = "~/.kube/config"

}

module "test" {

    source = "../"

    name      = "metrics"
    namespace = "kube-system"

}
