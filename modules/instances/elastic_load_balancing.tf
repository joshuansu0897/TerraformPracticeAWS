resource "aws_elb" "public_elb" {
  name            = var.public_elb_name
  security_groups = ["${aws_security_group.public_sg.id}"]
  subnets         = var.public_subnets.*.id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:80/"
  }

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "80"
    instance_protocol = "http"
  }
}

resource "aws_elb" "private_elb" {
  name            = var.private_elb_name
  security_groups = ["${aws_security_group.private_sg.id}"]
  subnets         = var.private_subnets.*.id
  internal        = true

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:80/"
  }

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "80"
    instance_protocol = "http"
  }
}
