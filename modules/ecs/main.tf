
resource "aws_ecs_cluster" "example" {
  name = "hcl_cluster"
}

resource "aws_ecs_task_definition" "hcl_taskdefination" {
  family                   = "hcl_task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "2048"

  container_definitions = jsonencode([
    {
      name      = "hcl_task"
      image     = "nginx"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "hcl_task_service" {
  name            = "hcl_task_service"
  cluster         = aws_ecs_cluster.example.id
  task_definition = aws_ecs_task_definition.hcl_taskdefination.arn
  desired_count   = 1
  launch_type     = "FARGATE"

/*
network_configuration {
  subnets          = [ module.network.public_subnet_id ] 
  security_groups  = [ module.network.public_sg_id ]
  assign_public_ip = true
}
*/

}
