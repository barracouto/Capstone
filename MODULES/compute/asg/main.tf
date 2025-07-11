resource "aws_launch_template" "this" {
  name_prefix   = "${var.env}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = base64encode(var.user_data)

  vpc_security_group_ids = var.security_group_ids
  iam_instance_profile {
    name = var.instance_profile_name
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = "${var.env}-ec2"
      Environment = var.env
    }
  }
}

resource "aws_autoscaling_group" "this" {
  name_prefix         = "${var.env}-asg-"
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.subnet_ids
  target_group_arns = compact([
    var.http_target_group_arn,
    var.https_target_group_arn != "" ? var.https_target_group_arn : null
  ])
  health_check_type         = "EC2"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Environment"
    value               = var.env
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "${var.env}-asg-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
