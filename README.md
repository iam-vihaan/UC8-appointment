# UC8-appointment


# UC8-appointment Project

## Overview

This project demonstrates the deployment of two microservices (Patient Service and Appointment Service) using AWS ECS Fargate. The architecture is designed to ensure high availability, scalability, and security.

## Architecture Diagram

![UC8-appointment AWS architecture diagram](https://copilot.microsoft.com/assets/UC8-appointment-architecture-diagram-clean.png)

## Architecture Components

### User
- Sends requests to the application.

### Application Load Balancer (ALB)
- Routes traffic to ECS services.

### VPC
- **Public Subnet**: Hosts the ALB.
- **Private Subnet**: Hosts the ECS Fargate services.

### ECS Cluster
- Runs two services:
  - **Patient Service**
  - **Appointment Service**

### CloudWatch
- Monitors logs and metrics from both services.

## Microservices

### Patient Service
- A Node.js microservice that handles patient-related operations.

### Appointment Service
- A Node.js microservice that handles appointment-related operations.

## Deployment

The deployment is managed using Terraform and AWS ECS Fargate. The infrastructure includes VPC, subnets, security groups, ECS cluster, task definitions, services, and ALB.

## Monitoring

AWS CloudWatch is used for monitoring logs and metrics from the ECS services.

## How to Use

1. Clone the repository.
2. Set up AWS credentials and Terraform variables.
3. Deploy the infrastructure using Terraform.
4. Build and deploy the microservices using Docker and ECS.

## Conclusion

This project showcases a robust and scalable architecture for deploying microservices using AWS ECS Fargate. The architecture ensures high availability, security, and efficient monitoring.

