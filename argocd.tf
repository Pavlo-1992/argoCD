resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.46.7"
  namespace  = "argocd"
  create_namespace = true

  values = [yamlencode({
    server = {
      extraArgs = [
        "--rootpath=/argo",
        "--basehref=/argo",
        "--insecure"
      ]
    }
  })]

  depends_on = [helm_release.nginx_ingress]
}

