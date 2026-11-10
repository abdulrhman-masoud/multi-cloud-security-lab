# Multi-Cloud AWS & Azure Security Lab (Zero Trust & Landing Zone)

A unified multi-cloud security architecture project implementing **Zero Trust principles**, **Centralized CSPM posture management**, and **automated IaC security compliance** via Terraform, GitHub Actions, and Checkov.

---

## 🏗️ Architecture & Multi-Cloud Strategy

This repository provisions isolated, secure landing zones across both **Amazon Web Services (AWS)** and **Microsoft Azure**, mapped to strict security benchmarks and posture tool readiness (Defender for Cloud / Sentinel).

### 1. AWS Security Baseline
* **Isolated VPC:** Configured with secure CIDR block allocation (`10.10.0.0/16`) and strict DNS options.
* **Network Hardening:** Default Security Group stripped of all inbound and outbound traffic rules to enforce absolute least-privilege boundary control (`CKV2_AWS_12`).

### 2. Azure Security Baseline
* **Virtual Network Isolation:** Deployed an isolated VNet (`10.20.0.0/16`) inside a production resource group.
* **Centralized Audit Logging:** Provisioned a Log Analytics Workspace with a **365-day retention policy** designed for multi-cloud telemetry aggregation, posture dashboards, and threat detection connectors.

### 3. Automated DevSecOps & CSPM Governance
* **Continuous Scanning:** Integrated Checkov within GitHub Actions to scan multi-cloud Terraform templates on every commit, ensuring immediate detection of security misconfigurations across both cloud environments.

---

## 🛠️ Tech Stack & Frameworks

* **Multi-Cloud Providers:** Amazon Web Services (AWS) & Microsoft Azure
* **Infrastructure as Code (IaC):** Terraform
* **DevSecOps / CI/CD:** GitHub Actions, Checkov
* **Security Frameworks:** Zero Trust, CSPM/CNAPP, CIS Benchmarks

---

## 🔄 Automated DevSecOps Pipeline

The repository features an automated GitHub Actions pipeline (`.github/workflows/multicloud-checkov.yml`) that triggers on every `push` and `pull_request` to the `main` branch.

### Scanning Process:
1. **Source Code Checkout:** Pulls the latest multi-cloud Terraform configuration files (`terraform/aws/` and `terraform/azure/`).
2. **Static Security Analysis:** Executes Checkov to scan IaC files against AWS and Azure CIS Benchmarks simultaneously.
3. **Compliance Verification:** Ensures 0 critical or high-risk misconfigurations exist before code deployment.

---

## 📂 Project Structure

```text
multi-cloud-security-lab/
├── .github/
│   └── workflows/
│       └── multicloud-checkov.yml  # Multi-Cloud CI/CD Pipeline
├── terraform/
│   ├── aws/
│   │   └── main.tf                 # AWS Security Landing Zone
│   └── azure/
│       └── main.tf                 # Azure Security Landing Zone
└── README.md                       # Project Documentation