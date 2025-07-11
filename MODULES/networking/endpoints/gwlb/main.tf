resource "aws_vpc_endpoint" "gwlbe" {
  count                = length(var.subnet_ids)
  vpc_id               = var.vpc_id
  service_name         = var.gwlb_service_name
  vpc_endpoint_type    = "GatewayLoadBalancer"
  subnet_ids           = [var.subnet_ids[count.index]]

  tags = {
    Name        = "${var.name_prefix}-gwlbe-${element(var.subnet_ids, count.index)}"
    Environment = var.env
  }
}

