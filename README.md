# **Tetris EKS Deployment**


This project demonstrates the automation of an end-to-end deployment pipeline for a **containerised Tetris game application** running on **Amazon Elastic Kubernetes Service (EKS)**. The pipeline showcases the integration of DevOps best practices, enabling efficient infrastructure management, secure deployments, and real-time monitoring of the application.

The Tetris application serves as a practical example to illustrate how modern tools and processes can be applied to deploy and manage a containerised app in a scalable and secure way. By leveraging **Terraform**, **NGINX**, **Prometheus**, **Grafana**, **Trivy**, and **Checkov**, this project highlights a complete workflow from infrastructure provisioning to application deployment.


---

### **Video Demo**
A recorded walkthrough of the setup and functionality. 

https://github.com/user-attachments/assets/ac244d5f-85e7-4b8f-a3b7-a6753df467c4


### **Terraform for AWS Infrastructure**
Through the use of **Terraform**, you can automate and standardise the provisioning of AWS resources, ensuring efficient and consistent infrastructure management:
- **Purpose**: Define and deploy core AWS components such as **Amazon EKS clusters**, **VPCs**, **subnets**, and **security groups** using declarative Infrastructure as Code (IaC).
- **Key Benefits**:
  - Achieves reproducible, version-controlled infrastructure for consistent environments.
  - Provides scalable and modular configurations adaptable to changing requirements.
  - Reduces manual intervention while embedding best practices into the automation process.

---

### **NGINX Ingress Controller**
Utilising the **NGINX Ingress Controller** allows for efficient management of application traffic in Kubernetes environments:
- **Purpose**: Handle HTTP and HTTPS traffic using **Ingress resources**, giving you full control over routing to services within the cluster.
- **Key Benefits**:
  - Simplifies external access to services with advanced routing and load balancing capabilities.
  - Offers extensive configurability, including TLS termination and path-based routing.
  - Minimises operational complexity by centralising traffic management for Kubernetes services.

---

### **Monitoring with Prometheus and Grafana**
With **Prometheus** and **Grafana**, you can establish a robust observability framework for monitoring infrastructure and application performance:
- **Purpose**: Collect, monitor, and visualise metrics to track system health, resource usage, and application behaviour.
- **Key Benefits**:
  - Delivers real-time insights into infrastructure and workloads, enabling proactive troubleshooting.
  - Supports the creation of custom dashboards to visualise metrics tailored to your operational needs.
  - Fully integrates with Kubernetes, providing a comprehensive view of cluster performance and health.

---

### **Security in the Pipeline**
Integrating security tools into your CI/CD pipeline enhances your ability to identify and address risks early:
- **Trivy**: Performs vulnerability scans on container images, identifying potential security issues before deployment.
- **Checkov**: Validates Terraform configurations against security best practices, reducing the likelihood of misconfigurations.
- **Key Benefits**:
  - Strengthens your security posture with automated, continuous checks.
  - Reduces downstream vulnerabilities by addressing risks early in the development lifecycle.
  - Provides confidence in deployment security by embedding best practices throughout the pipeline.


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



