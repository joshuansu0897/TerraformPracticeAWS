resource "aws_autoscaling_group" "asg_public" {
  launch_configuration = aws_launch_configuration.asg_config_public.id
  min_size             = var.min_size
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  vpc_zone_identifier  = var.public_subnets.*.id
  load_balancers       = ["${aws_elb.public_elb.name}"]

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "my-terraform-asg-example-public"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg_private" {
  launch_configuration = aws_launch_configuration.asg_config_private.id
  min_size             = var.min_size
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  vpc_zone_identifier  = var.private_subnets.*.id
  load_balancers       = ["${aws_elb.private_elb.name}"]

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "my-terraform-asg-example-private"
  }

  lifecycle {
    create_before_destroy = true
  }
}
