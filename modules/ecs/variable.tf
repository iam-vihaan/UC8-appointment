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
  
}

variable "aws_ecs_service_security_groups" {
    description = "ECS service security groups"
  
}

variable "aws_ecs_service_cluster" {
    description = "ECS service cluster"
  
}

variable "aws_ecs_service_task_definition" {
    description = "ECS service task definition"
  
}
