# k8s-production-project

# 🚀 Kubernetes Production Setup Project

## 📌 Overview

This project demonstrates a **production-grade Kubernetes deployment** using modern DevOps practices.

It includes:

* Containerized application (Node.js)
* Kubernetes base manifests
* Multi-environment configuration (dev & prod using Kustomize)
* Helm-based deployment
* Ingress for external access
* Zero-downtime rolling deployments

---

# 🧱 Architecture

Application Flow:

User → Ingress → Service → Pods (Deployment) → Container

---

# 📂 Project Structure

```
k8s-production-project/
│
├── app/                     # Node.js application
│
├── k8s/
│   ├── base/               # Base Kubernetes manifests
│   ├── overlays/           # Environment-specific configs
│       ├── dev/
│       ├── prod/
│
├── helm/
│   └── devops-app/         # Helm chart
│
├── ingress/                # Ingress configuration
│
├── Dockerfile
├── scripts/
└── README.md
```

---

# 🧰 Prerequisites

Install the following tools:

### 1. Docker

Verify:

```
docker --version
```

### 2. Minikube

Verify:

```
minikube version
```

### 3. kubectl

Verify:

```
kubectl version --client
```

### 4. Helm

Verify:

```
helm version
```

---

# 🧪 Application Setup

The application is a simple Node.js service with:

* `/` → main endpoint
* `/health` → health check (used by Kubernetes probes)

---

# 🐳 Docker Setup

## Build Image

```
docker build -t devops-app .
```

## Load into Minikube

```
minikube image load devops-app
```

---

# ☸️ Kubernetes Deployment (Kustomize)

## Step 1: Start Cluster

```
minikube start
```

---

## Step 2: Enable Ingress

```
minikube addons enable ingress
```

---

## Step 3: Deploy (Dev Environment)

```
kubectl apply -k k8s/overlays/dev
```

---

## Step 4: Verify

```
kubectl get pods
kubectl get svc
```

---

## Step 5: Access App

```
minikube service devops-service
```

---

# 🔁 Multi-Environment Setup

| Environment | Replicas |
| ----------- | -------- |
| Dev         | 1        |
| Prod        | 3        |

Run prod:

```
kubectl apply -k k8s/overlays/prod
```

---

# 🌐 Ingress Setup

## Apply Ingress

```
kubectl apply -f ingress/
```

---

## Update Hosts File

Add this to `/etc/hosts`:

```
127.0.0.1 devops.local
```

---

## Access via Browser

```
http://devops.local
```

---

# 📦 Helm Deployment

## Install Helm Chart

```
helm install devops helm/devops-app
```

---

## Upgrade Deployment

```
helm upgrade devops helm/devops-app
```

---

## Uninstall

```
helm uninstall devops
```

---

# 🔄 Zero Downtime Deployment

Rolling updates are configured with:

* `maxUnavailable = 0`
* `maxSurge = 1`

## Test

```
kubectl rollout restart deployment devops-app
kubectl rollout status deployment devops-app
```

---

# 🧪 Health Checks

* Readiness Probe → ensures pod is ready before traffic
* Liveness Probe → restarts unhealthy containers

Test manually:

```
curl http://localhost:3000/health
```

---

# 🧠 Key Features

* Kubernetes production setup
* Multi-environment deployment (dev/prod)
* Helm-based templating
* Ingress routing
* Zero-downtime rolling updates
* Health monitoring

---

# ⚠️ Important Notes

* Docker image name must match Helm values
* Minikube must be running before deployment
* Ingress requires addon enabled
* Secrets are base64 encoded

---

# 🚀 Future Improvements

* Add HPA (Horizontal Pod Autoscaler)
* Add monitoring (Prometheus + Grafana)
* Add logging (EFK stack)
* Add CI/CD pipeline integration

---

# 🏆 Outcome

This project demonstrates:

* Real-world Kubernetes deployment practices
* DevOps production readiness
* Scalable and maintainable architecture
* Practical implementation of SRE concepts

---

# 👩‍💻 Author

DevOps Engineer | Kubernetes | Cloud | CI/CD
