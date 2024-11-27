# **Tetris EKS Deployment**


This project demonstrates the automation of an end-to-end deployment pipeline for a **containerised Tetris game application** running on **Amazon Elastic Kubernetes Service (EKS)**. The pipeline showcases the integration of DevOps best practices, enabling efficient infrastructure management, secure deployments, and real-time monitoring of the application.

The Tetris application serves as a practical example to illustrate how modern tools and processes can be applied to deploy and manage a containerised app in a scalable and secure way. By leveraging **Terraform**, **NGINX**, **Prometheus**, **Grafana**, **Trivy**, and **Checkov**, this project highlights a complete workflow from infrastructure provisioning to application deployment.


---

### **Video Demo**
A recorded walkthrough of the setup and functionality. 

https://github.com/user-attachments/assets/ac244d5f-85e7-4b8f-a3b7-a6753df467c4

## **Project Objectives**

| Objective                                           | Description                                                                                   |
|-----------------------------------------------------|-----------------------------------------------------------------------------------------------|
| **Board / Tickets**                                 | Manage project tasks effectively using a ticketing system.                                    |
| **Terraform for AWS Infrastructure**               | Provision AWS resources such as EKS, VPC, and other required infrastructure.                  |
| **Setup NGINX Ingress Controller for Kubernetes**   | Enable routing for Kubernetes services using NGINX Ingress.                                   |
| **Setup Monitoring with Prometheus and Grafana**    | Provide visibility and monitoring for the cluster and application performance.                |
| **Setup Security in the Pipeline**                 | Incorporate tools like **Trivy** (container security) and **Checkov** (infrastructure security). |

---

## **Why Each Component is Needed**

### **Terraform for AWS Infrastructure**
- **Purpose**: Automate the provisioning of AWS resources such as EKS, VPC, subnets, and security groups.
- **Outcome**: Achieve infrastructure as code (IaC) for reproducible and scalable deployments.

### **NGINX Ingress Controller**
- **Purpose**: Manage HTTP and HTTPS traffic to Kubernetes services using Ingress resources.
- **Outcome**: Simplifies external access to applications in the Kubernetes cluster.

### **Monitoring with Prometheus and Grafana**
- **Purpose**: Enable observability of system health, resource usage, and application metrics.
- **Outcome**: Real-time insights and proactive issue detection.

### **Security in the Pipeline**
- **Trivy**: Scans container images for vulnerabilities.
- **Checkov**: Validates Terraform configurations for security best practices.
- **Outcome**: Improve security posture and mitigate risks early in the development lifecycle.

---

## **Pipelines**

| Pipeline             | Description                                                                                       |
|----------------------|---------------------------------------------------------------------------------------------------|
| **Pipeline 1**       | Deploys Terraform configurations to provision AWS infrastructure (EKS, VPC, etc.) using modules. |
| **Pipeline 2**       | Runs security tests (Trivy and Checkov), builds Docker images, pushes them to ECR, and deploys to EKS. |

---


### **Architectural Diagram**

Loading....

---

## **Useful Resources**

| Resource                                | Description                                |
|----------------------------------------|--------------------------------------------|
| [Terraform Documentation](https://www.terraform.io/docs) | Official Terraform documentation.          |
| [NGINX Ingress Controller](https://kubernetes.github.io/ingress-nginx/) | Guide to setting up the NGINX Ingress.     |
| [Prometheus](https://prometheus.io/docs/introduction/overview/) | Official Prometheus documentation.         |
| [Grafana](https://grafana.com/docs/grafana/latest/) | Official Grafana documentation.            |
| [Trivy](https://aquasecurity.github.io/trivy/) | Security scanning for container images.    |
| [Checkov](https://www.checkov.io/) | Infrastructure code security checks.       |

---

## **Contributors**

- [Sohail Sajid](https://github.com/sohailsajid79) 
- [Abdirahman](https://github.com/ABDIRAHMAN-I) 
- [Zeynab](https://github.com/zyusuf88) 

---


