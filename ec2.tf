resource "aws_iam_role" "execution_role" {
  name = "ecs-ec2-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_permissions" {
  role       = aws_iam_role.execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "ecs-instanceprofile"
  role = aws_iam_role.execution_role.name
}

resource "aws_launch_template" "ecs_lt" {
  name_prefix            = "ecs-template"
  image_id               = "ami-05339d597592d45cf"
  instance_type          = var.ec2_type
  key_name               = var.ec2_key_name
  vpc_security_group_ids = [aws_security_group.security_group.id]
  iam_instance_profile {
    arn = aws_iam_instance_profile.instance_profile.arn
  }
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size           = 30
      encrypted             = true
      delete_on_termination = true
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ecs-instance"
    }
  }

  monitoring {
    enabled = true
  }

  user_data = base64encode("#!/bin/bash\necho ECS_CLUSTER=${var.cluster_name} >> /etc/ecs/ecs.config")

}