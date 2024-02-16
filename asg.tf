resource "aws_autoscaling_group" "ecs_asg" {
  vpc_zone_identifier   = [aws_subnet.private_subnet_0.id, aws_subnet.private_subnet_1.id]
  desired_capacity      = 2
  max_size              = 3
  min_size              = 2
  protect_from_scale_in = false
  launch_template {
    id      = aws_launch_template.ecs_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }

}