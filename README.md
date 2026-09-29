# Enterprise DevSecOps Pipeline 🚀

This repository demonstrates a complete, zero-trust **DevSecOps** CI/CD pipeline and Kubernetes runtime security architecture. It shifts security left by catching vulnerabilities in code, containers, and infrastructure *before* deployment, while enforcing strict admission controls at runtime.

## 🏗️ Architecture Overview

The pipeline implements multiple "Security Gates". If code fails any gate, the build is blocked.

1. **SAST (Static Application Security Testing)**: Uses **SonarQube** to scan application source code for code smells, bugs, and hardcoded secrets.
2. **IaC Security (Infrastructure as Code)**: Uses **Checkov** to scan Kubernetes YAML manifests (e.g., ensuring containers don't run as root).
3. **Container Vulnerability Scanning**: Uses **Trivy** to scan built Docker images for critical CVEs before deployment.
4. **Dynamic Secrets Management**: Uses **HashiCorp Vault** with Vault Agent Injector to dynamically inject database credentials into Kubernetes Pods at runtime, completely eliminating hardcoded K8s secrets.
5. **Runtime Security**: Uses **Kyverno** as an admission controller to physically block any unapproved or privileged pods from being scheduled on the cluster.

## 🛠️ Technology Stack
* **CI/CD:** GitHub Actions
* **Container Orchestration:** Kubernetes (Docker Desktop / Minikube)
* **Secrets Management:** HashiCorp Vault
* **Security Scanning:** SonarQube, Trivy, Checkov
* **Policy Enforcement:** Kyverno

## 📁 Repository Structure
* `.github/workflows/devsecops.yaml` - The GitHub Actions CI/CD pipeline containing all security scanning stages.
* `devsecops-pipeline/k8s/app-deployment.yaml` - A sample Kubernetes deployment demonstrating Vault secret injection.
* `devsecops-pipeline/k8s/kyverno-policy.yaml` - A Kyverno ClusterPolicy enforcing `runAsNonRoot: true` on all pods.

## 💡 Key Features
* **Zero-Trust Secrets**: Passwords exist only in Vault memory and are injected at runtime.
* **Automated Bouncers**: Kyverno physically rejects `kubectl apply` commands that violate security contexts.
* **Shift-Left Security**: Developers are alerted to vulnerabilities instantly via GitHub Actions before code merges to main.