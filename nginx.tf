resource "helm_release" "nginx_ingress" {
  name             = "nginx-ingress"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true
  version          = "4.9.0"

  values = [yamlencode({
    controller = {
      publishService = {
        enabled = true
      }
    }
  })]

  depends_on = [module.eks]
}

