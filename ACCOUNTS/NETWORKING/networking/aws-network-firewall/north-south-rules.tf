resource "aws_networkfirewall_rule_group" "north_south" {
  capacity = 100
  name     = "${var.name_prefix}-north-south"
  type     = "STATEFUL"

  rule_group {
    rules_source {
      rules_string = <<-EOT
        pass tcp ${var.prod_vpc_cidr} any -> 0.0.0.0/0 80 (sid:101;)
        pass tcp ${var.prod_vpc_cidr} any -> 0.0.0.0/0 443 (sid:102;)

        pass tcp ${var.shared_services_vpc_cidr} any -> 0.0.0.0/0 443 (sid:103;)

        pass tcp 0.0.0.0/0 80 -> ${var.prod_vpc_cidr} any (sid:104;)
        pass tcp 0.0.0.0/0 443 -> ${var.prod_vpc_cidr} any (sid:105;)
        pass tcp 0.0.0.0/0 443 -> ${var.shared_services_vpc_cidr} any (sid:106;)

        pass udp ${var.prod_vpc_cidr} any -> 0.0.0.0/0 53 (sid:107;)
        pass tcp ${var.prod_vpc_cidr} any -> 0.0.0.0/0 53 (sid:108;)

        pass udp 0.0.0.0/0 53 -> ${var.prod_vpc_cidr} any (sid:109;)
        pass tcp 0.0.0.0/0 53 -> ${var.prod_vpc_cidr} any (sid:110;)

        drop ip any any -> any any (sid:999;)
      EOT
    }
  }

  tags = var.tags
}


resource "aws_networkfirewall_firewall_policy" "north_south" {
  name = "${var.name_prefix}-north-south-policy"

  firewall_policy {
    stateful_rule_group_reference {
      resource_arn = aws_networkfirewall_rule_group.north_south.arn
    }

    stateless_default_actions          = ["aws:forward_to_sfe"]
    stateless_fragment_default_actions = ["aws:forward_to_sfe"]
  }

  tags = var.tags
}


############################
# Logging configuration for the firewall
# ALERT logs: Record firewall rule matches
# FLOW logs: Record network traffic flow
############################
resource "aws_networkfirewall_logging_configuration" "north_south" {
  firewall_arn = aws_networkfirewall_firewall.north_south.arn

  logging_configuration {
    log_destination_config {
      log_type             = "ALERT"
      log_destination_type = "CloudWatchLogs"
      log_destination = {
        logGroup = aws_cloudwatch_log_group.ns_firewall_logs.name
      }
    }

    log_destination_config {
      log_type             = "FLOW"
      log_destination_type = "CloudWatchLogs"
      log_destination = {
        logGroup = aws_cloudwatch_log_group.ns_firewall_logs.name
      }
    }
  }
}
############################
# Creates a CloudWatch log group for firewall logs
############################
resource "aws_cloudwatch_log_group" "ns_firewall_logs" {
  name              = "/aws/network-firewall/north-south/${var.name_prefix}"
  retention_in_days = 30
}