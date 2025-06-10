provider "aws" {
  region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key  
  
}

module "vpc" {
  source = "./modules/vpc"
  # aws_vpc_name = var.aws_vpc_name
  # aws_security_group_name = var.aws_security_group_name
  aws_vpc_cidr = var.aws_vpc_cidr
  aws_public_subnet_cidr = var.aws_public_subnet_cidr
  aws_private_subnet_cidr = var.aws_private_subnet_cidr

}

module "S3" {
  source = "./modules/S3"
  aws_s3_bucket_name = var.aws_s3_bucket_name
  object_lock_enabled = var.object_lock_enabled
  tags = var.tags
}

module "ECR" {
  source = "./modules/ECR"
  aws_ecr_repo_name = var.aws_ecr_repo_name
  image_tag_mutability = var.image_tag_mutability
  scan_on_push = var.scan_on_push
  
}

module "ECS" {
  source = "./modules/ECS"
  aws_ecs_task_cpu = var.aws_ecs_task_cpu
  aws_ecs_task_memory = var.aws_ecs_task_memory
  aws_ecs_task_container_name = var.aws_ecs_task_container_name
  aws_ecs_task_container_image = var.aws_ecs_task_container_image
  aws_ecs_task_container_port = var.aws_ecs_task_container_port
  aws_ecs_service_name = var.aws_ecs_service_name
  aws_ecs_service_desired_count = var.aws_ecs_service_desired_count
  aws_ecs_service_launch_type = var.aws_ecs_service_launch_type
  aws_ecs_service_assign_public_ip = var.aws_ecs_service_assign_public_ip
  aws_ecs_service_subnets = var.aws_ecs_service_subnets
  aws_ecs_service_security_groups = var.aws_ecs_service_security_groups
  aws_ecs_service_cluster = var.aws_ecs_service_cluster
  aws_ecs_service_task_definition = var.aws_ecs_service_task_definition
}
