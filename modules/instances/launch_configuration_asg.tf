resource "aws_launch_configuration" "asg_config_public" {
  image_id                    = data.aws_ami.latest_ubuntu.image_id
  instance_type               = var.instance_type
  security_groups             = ["${aws_security_group.public_sg.id}"]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key_access.key_name

  user_data = file("${path.module}/src/start-app.sh")

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "asg_config_private" {
  image_id        = data.aws_ami.latest_ubuntu.image_id
  instance_type   = var.instance_type
  security_groups = ["${aws_security_group.private_sg.id}"]
  key_name        = aws_key_pair.key_access.key_name

  user_data = file("${path.module}/src/start-app.sh")

  lifecycle {
    create_before_destroy = true
  }
}
