resource "aws_lb_target_group" "gwlb_target_group" {
  name        = "${var.env}-gwlb-tg"
  port        = 6081
  protocol    = "GENEVE"
  target_type = "instance"
  vpc_id      = data.terraform_remote_state.firewall_vpc.outputs.vpc_id

  health_check {
    protocol = "TCP"
    port     = "traffic-port"
  }

  tags = {
    Name        = "${var.env}-gwlb-tg"
    Environment = var.env
  }
}

resource "aws_lb_target_group_attachment" "firewall_a" {
  target_group_arn = aws_lb_target_group.gwlb_target_group.arn
  target_id        = module.firewall_a.instance_id
}

resource "aws_lb_target_group_attachment" "firewall_b" {
  target_group_arn = aws_lb_target_group.gwlb_target_group.arn
  target_id        = module.firewall_b.instance_id
}
