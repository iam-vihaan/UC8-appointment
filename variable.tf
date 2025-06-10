variable "aws_region" {
    description = "AWS region"
    default = "us-east-1"
}

variable "aws_security_group_name" {
    description = "Public_SG"
    default = "uc8-sg"
  
}

variable "aws_vpc_name" {
    description = "VPC name"
    default = "kasi_hcl_vpc"
}   

variable "aws_vpc_cidr" {
    description = "CIDR block for the VPC"
    default = "10.0.0.0/16"  
}

variable "aws_public_subnet_cidr" {
    description = "CIDR block for the subnet"
    default = "10.0.1.0/24"
}

variable "aws_private_subnet_cidr" {
    description = "CIDR block for the subnet"
    default = "10.0.2.0/24" 
}

variable "aws_s3_bucket_name" {
    description = "S3 bucket name"
    default = "kasi-hcl-bucket"
}

variable "object_lock_enabled" {
    description = "Enable object lock"
    default = true
}

variable "tags" {
    description = "Tags for the S3 bucket"
    default = {
        Name        = "kasi_hcl-bucket"
        Environment = "dev"
    }
}

variable "aws_ecr_repo_name" {
    description = "ECR repository name"
    default = "kasi_hcl-repo"
}

variable "image_tag_mutability" {
    description = "Image tag mutability"
    default = "MUTABLE"
}

variable "scan_on_push" {
    description = "Scan on push"
    default = true
}

variable "aws_ecs_cluster_name" {
    description = "ECS cluster name"
    default = "kasi_hcl-cluster"
}

variable "aws_ecs_task_family" {
    description = "ECS task family"
    default = "kasi_hcl-task"
  
}

variable "aws_ecs_task_cpu" {
    description = "ECS task CPU"
    default = "256"
}

variable "aws_ecs_task_memory" {
    description = "ECS task memory"
    default = "512"
  
}

variable "aws_ecs_task_container_name" {
    description = "ECS task container name"
    default = "kasi_hcl-container"
  
}

variable "aws_ecs_task_container_image" {
    description = "ECS task container image"
    default = "nginx:latest"
  
}

variable "aws_ecs_task_container_port" {
    description = "ECS task"
    default = "80"
  
}

variable "aws_ecs_service_name" {
    description = "ECS service name"
    default = "kasi_hcl-service"
  
}

variable "aws_ecs_service_desired_count" {
    description = "ECS service desired count"
    default = 1
  
}

variable "aws_ecs_service_launch_type" {
    description = "ECS service launch type"
    default = "EC2"
  
}

variable "aws_ecs_service_assign_public_ip" {
    description = "ECS service assign public IP"
    default = true
  
}

variable "aws_ecs_service_subnets" {
    description = "ECS service subnets" 
    default = "kasi_hcl_subnet"
  
}

variable "aws_ecs_service_security_groups" {
    description = "ECS service security groups"
    default = "kasi_hcl_sg"
  
}

variable "aws_ecs_service_cluster" {
    description = "ECS service cluster"
    default = "kasi_hcl-cluster"
  
}

variable "aws_ecs_service_task_definition" {
    description = "ECS service task definition"
    default = "kasi_hcl-task"
  
}
