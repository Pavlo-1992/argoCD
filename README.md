ArgoCD AWS EKS Deployment Project

This project automates the creation of AWS infrastructure with a Kubernetes cluster (EKS), installs Argo CD, and deploys a simple Python application with CI/CD support.

🚀 How to Deploy the Cluster and Argo CD
1. Preparation

Create a Docker repository on Docker Hub and push the image savanchukpavlo/step_5_backend:test.

Clone the repository:

git clone https://github.com/Pavlo-1992/argoCD.git
cd argoCD


Export your AWS credentials:

export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...

2. Terraform Init and Apply
terraform init
terraform plan
terraform apply


After the cluster is created:

aws eks update-kubeconfig --name <YOUR_CLUSTER_NAME>

3. Deploy Argo CD Application
kubectl apply -f argocd-application.yaml


Argo CD will automatically deploy the app, nginx ingress, and all dependencies.

4. Access the Application and Argo CD
kubectl get ingress -A
kubectl get svc -n ingress-nginx


App URL: http://<AWS_LB_DNS_NAME>/app

Argo CD UI: http://<AWS_LB_DNS_NAME>/argo

🔐 Argo CD UI Login
user: admin
password: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

⚙️ CI/CD with Argo CD

Modifying the Docker image in deployment.yaml (e.g., from :latest to :test) will automatically trigger a redeployment via Argo CD.

image: savanchukpavlo/step_5_backend:test

📌 Useful Commands
kubectl get all -n app
kubectl describe pod <pod-name> -n app
kubectl logs <pod-name> -n app
