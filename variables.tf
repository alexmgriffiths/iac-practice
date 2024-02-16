variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "11.0.0.0/16"
}

variable "environment" {
    description = "Environment"
    type = string
    default = "dev"
}

variable "cluster_name" {
    description = "Cluster Name"
    type = string
    default = "ecs-dev"
}

variable "service_name" {
    description = "Service Name"
    type = string
    default = "service-dev"
}

variable "container_name" {
    description = "Container Name"
    type = string
    default = "container-dev"
}

variable "container_image" {
    description = "Container Image"
    type = string
    default = "392409988284.dkr.ecr.us-east-1.amazonaws.com/dev:latest"
}

variable "ecs_task_execution_role" {
    description = "ECS Task Execution Role"
    type = string
    default = "arn:aws:iam::392409988284:role/ecsTaskExecutionRole"
}

variable "ecs_task_name" {
    description = "ECS Task Name"
    type = string
    default = "ecs-task"
}

variable "ec2_type" {
    description = "EC2 Type"
    type = string
    default = "t2.medium"
}

variable "ec2_key_name" {
    description = "EC2 Key Name"
    type = string
    default = "dev"
}