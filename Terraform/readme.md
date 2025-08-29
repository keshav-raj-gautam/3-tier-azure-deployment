# Azure 3-Tier Web Application Deployment

This project demonstrates the deployment of a scalable 3-tier web application on Microsoft Azure using Infrastructure as Code (IaC) with Terraform, configuration management with Ansible, and containerization with Docker.

## Architecture Overview

![Architecture](./diagrams/Infra.jpg)

### Components
* Resource Group for centralized resource management  
* Virtual Network (VNet) with multiple subnets  
  * frontend-subnet – Hosts frontend containers in a VM Scale Set  
  * backend-subnet – Hosts backend API containers in a VM Scale Set  
  * db-subnet – Hosts database containers in a VM Scale Set  
  * appgw-subnet – Dedicated subnet for the Application Gateway  
  * jumpbox-subnet – Provides secure access and automation with Ansible  
* Azure Application Gateway for public access, routing, and load balancing  
* Virtual Machine Scale Sets (VMSS) for scalability and redundancy across all tiers  
* Private DNS and Internal Load Balancers for inter-tier communication  
* Jumpbox VM running Ansible for automated configuration and container deployments  

## Workflow

1. Provision infrastructure with Terraform (network, subnets, VMSS, Application Gateway, Jumpbox, DNS, etc.)  
2. Connect to the Jumpbox for secure access  
3. Use Ansible playbooks to pull Docker images and deploy frontend, backend, and database containers  
4. Users access the application via the Application Gateway public IP or domain, which routes traffic to the frontend. The frontend communicates with the backend, which then interacts with the database  
