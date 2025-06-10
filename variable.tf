variable "aws_region" {
  type        = string
  description = "The AWS region to deploy resources in"
}

variable "aws_security_group_name" {
    description = "Public_SG"
    type        = string
    default = "kasi_hcl_sg"
  
}

variable "aws_vpc_name" {
    description = "VPC name"
    type        = string
    default = "kasi_hcl_vpc"
}   

variable "aws_vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
    default = "10.0.0.0/16"  
}

variable "aws_public_subnet_cidr" {
    description = "CIDR block for the subnet"
    type        = string
    default = "10.0.1.0/24"
}

variable "aws_private_subnet_cidr" {
    description = "CIDR block for the subnet"
    default = "10.0.2.0/24"
    type        = string
}

variable "aws_s3_bucket_name" {
    description = "S3 bucket name"
    type        = string
    default = "kasi-hcl-bucket"
}

variable "object_lock_enabled" {
    description = "Enable object lock"
    type        = bool
    default = true
}

variable "tags" {
    description = "Tags for the S3 bucket"
    type  = map
    default = {
        Name        = "kasi_hcl-bucket"
        Environment = "dev"
    }
}

variable "aws_ecr_repo_name" {
    description = "ECR repository name"
    type = string
    default = "kasi_hcl-repo"
}

variable "image_tag_mutability" {
    description = "Image tag mutability"
    type = string
    default = "MUTABLE"
}

variable "scan_on_push" {
    description = "Scan on push"
    type = bool
    default = true
}

variable "aws_ecs_cluster_name" {
    description = "ECS cluster name"
    type = string
    default = "kasi_hcl-cluster"
}

variable "aws_ecs_task_family" {
    description = "ECS task family"
    type = string
    default = "kasi_hcl-task"
  
}

variable "aws_ecs_task_cpu" {
    description = "ECS task CPU"
    type = number
    default = "256"
}

variable "aws_ecs_task_memory" {
    description = "ECS task memory"
    type = number
    default = "512"
  
}

variable "aws_ecs_task_container_name" {
    description = "ECS task container name"
    type = string
    default = "kasi_hcl-container"
  
}

variable "aws_ecs_task_container_image" {
    description = "ECS task container image"
    type = string
    default = "nginx:latest"
  
}

variable "aws_ecs_task_container_port" {
    description = "ECS task"
    type = number
    default = "80"
  
}

variable "aws_ecs_service_name" {
    description = "ECS service name"
    type = string
    default = "kasi_hcl-service"
  
}

variable "aws_ecs_service_desired_count" {
    description = "ECS service desired count"
    type = number
    default = 1
  
}

variable "aws_ecs_service_launch_type" {
    description = "ECS service launch type"
    type = string
    default = "EC2"
  
}

variable "aws_ecs_service_assign_public_ip" {
    description = "ECS service assign public IP" 
    type = bool
    default = true
  
}

variable "aws_ecs_service_subnets" {
    description = "ECS service subnets" 
    type = list
    default = "kasi_hcl_subnet"
  
}

variable "aws_ecs_service_security_groups" {
    description = "ECS service security groups"
    type = list
    default = "kasi_hcl_sg"
  
}

variable "aws_ecs_service_cluster" {
    description = "ECS service cluster"
    type = string
    default = "kasi_hcl-cluster"
  
}

variable "aws_ecs_service_task_definition" {
    description = "ECS service task definition"
    type = string
    default = "kasi_hcl-task"
  
}
