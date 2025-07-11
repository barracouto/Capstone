############################
# Standard egress filtering - allows instances access to web services and resolve DNS
# Dev can only access 
# All other traffic is blocked
############################

resource "aws_networkfirewall_rule_group" "egress_allow" {
  capacity = 100
  name     = "${var.name_prefix}-egress-allow"
  type     = "STATEFUL"

  rule_group {
    rules_source {
      rules_string = <<-EOT
        pass tcp ${var.prod_vpc_cidr} any -> any 80 (sid:101;)
        pass tcp ${var.prod_vpc_cidr} any -> any 443 (sid:102;)
        pass udp ${var.prod_vpc_cidr} any -> any 53 (sid:103;)
        pass tcp ${var.prod_vpc_cidr} any -> any 53 (sid:104;)
        pass icmp ${var.prod_vpc_cidr} any -> any any (sid:115;)

        pass tcp ${var.shared_services_vpc_cidr} any -> any 80 (sid:105;)
        pass tcp ${var.shared_services_vpc_cidr} any -> any 443 (sid:106;)
        pass udp ${var.shared_services_vpc_cidr} any -> any 53 (sid:107;)
        pass tcp ${var.shared_services_vpc_cidr} any -> any 53 (sid:108;)
        pass icmp ${var.shared_services_vpc_cidr} any -> any any (sid:116;)

        pass tcp ${var.dev_vpc_cidr} any -> ${var.vpn_cidr} 443 (sid:109;)
        pass udp ${var.dev_vpc_cidr} any -> ${var.vpn_cidr} 53 (sid:110;)
        pass tcp ${var.dev_vpc_cidr} any -> ${var.vpn_cidr} 53 (sid:111;)
        pass icmp ${var.dev_vpc_cidr} any -> ${var.vpn_cidr} any (sid:117;)

        pass tcp ${var.dev_vpc_cidr} any -> ${var.networking_vpc_cidr} 443 (sid:112;)
        pass udp ${var.dev_vpc_cidr} any -> ${var.networking_vpc_cidr} 53 (sid:113;)
        pass tcp ${var.dev_vpc_cidr} any -> ${var.networking_vpc_cidr} 53 (sid:114;)
        pass icmp ${var.dev_vpc_cidr} any -> ${var.networking_vpc_cidr} any (sid:118;)

        pass tcp ${var.networking_vpc_cidr} any -> ${var.dev_vpc_cidr} 443 (sid:212;)
        pass udp ${var.networking_vpc_cidr} any -> ${var.dev_vpc_cidr} 53 (sid:213;)
        pass tcp ${var.networking_vpc_cidr} any -> ${var.dev_vpc_cidr} 53 (sid:214;)
        pass tcp ${var.networking_vpc_cidr} any -> ${var.dev_vpc_cidr} 80 (sid:215;)
        pass icmp ${var.networking_vpc_cidr} any -> ${var.dev_vpc_cidr} any (sid:218;)
        
        pass tcp ${var.vpn_cidr} any -> ${var.dev_vpc_cidr} 443 (sid:312;)
        pass udp ${var.vpn_cidr} any -> ${var.dev_vpc_cidr} 53 (sid:313;)
        pass tcp ${var.vpn_cidr} any -> ${var.dev_vpc_cidr} 53 (sid:314;)
        pass icmp ${var.vpn_cidr} any -> ${var.dev_vpc_cidr} any (sid:318;)
      EOT
    }
    stateful_rule_options {
      rule_order = "DEFAULT_ACTION_ORDER"
    }
  }

  tags = var.tags
}


############################
# Controls inter-VPC traffic
# Enforces VPC-level segmentation
# Allows only approved communication paths
# Blocks unapproved cross-talk 
############################
resource "aws_networkfirewall_rule_group" "east_west" {
  capacity = 100
  name     = "${var.name_prefix}-eastwest"
  type     = "STATEFUL"
  rule_group {
    rules_source {
      rules_string = <<-EOT
        pass icmp ${var.vpn_cidr} any -> ${var.dev_vpc_cidr} any (sid:100;)
        pass tcp ${var.prod_vpc_cidr} any -> ${var.shared_services_vpc_cidr} 443 (sid:101;)
        pass tcp ${var.dev_vpc_cidr} any -> ${var.shared_services_vpc_cidr} 443 (sid:105;)

        pass tcp ${var.dev_vpc_cidr} any -> ${var.shared_services_vpc_cidr} 3306 (sid:102;)
        pass tcp ${var.prod_vpc_cidr} any -> ${var.shared_services_vpc_cidr} 3306 (sid:106;)

        drop ip ${var.dev_vpc_cidr} any -> ${var.prod_vpc_cidr} any (sid:103;)
        drop ip ${var.prod_vpc_cidr} any -> ${var.dev_vpc_cidr} any (sid:104;)
        EOT
    }
    stateful_rule_options {
      rule_order = "DEFAULT_ACTION_ORDER"
    }
  }

  tags = var.tags
}

############################
# Controls inbound traffic from the VPN
# Prevents broad access to production from production
# Allows management access to specific hosts
############################
resource "aws_networkfirewall_rule_group" "vpn_ingress" {
  capacity = 100
  name     = "${var.name_prefix}-vpn-ingress"
  type     = "STATEFUL"
  rule_group {
    rules_source {
      rules_string = <<-EOT
        pass ip ${var.vpn_cidr} any -> ${var.dev_vpc_cidr} any (sid:201;)
        drop ip ${var.vpn_cidr} any -> ${var.prod_vpc_cidr} any (sid:202;)
      EOT
    }
  }

  tags = var.tags
}

############################
# Allows networking VPC to access all other VPCs
############################
resource "aws_networkfirewall_rule_group" "networking_allow" {
  capacity = 100
  name     = "${var.name_prefix}-networking-allow"
  type     = "STATEFUL"

  rule_group {
    rules_source {
      rules_string = <<-EOT
        pass ip ${var.networking_vpc_cidr} any -> any any (sid:301;)
      EOT
    }
  }

  tags = var.tags
}

############################
# Policy aggregates rule groups into a firewall policy
############################
resource "aws_networkfirewall_firewall_policy" "this" {
  name = "${var.name_prefix}-policy"

  firewall_policy {
    stateful_rule_group_reference {
      resource_arn = aws_networkfirewall_rule_group.egress_allow.arn
    }

    stateful_rule_group_reference {
      resource_arn = aws_networkfirewall_rule_group.east_west.arn
    }

    stateful_rule_group_reference {
      resource_arn = aws_networkfirewall_rule_group.vpn_ingress.arn
    }

    stateful_rule_group_reference {
      resource_arn = aws_networkfirewall_rule_group.networking_allow.arn
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
resource "aws_networkfirewall_logging_configuration" "this" {
  firewall_arn = aws_networkfirewall_firewall.this.arn

  logging_configuration {
    log_destination_config {
      log_type             = "ALERT"
      log_destination_type = "CloudWatchLogs"
      log_destination = {
        logGroup = aws_cloudwatch_log_group.firewall_logs.name
      }
    }

    log_destination_config {
      log_type             = "FLOW"
      log_destination_type = "CloudWatchLogs"
      log_destination = {
        logGroup = aws_cloudwatch_log_group.firewall_logs.name
      }
    }
  }
}
############################
# Creates a CloudWatch log group for firewall logs
############################
resource "aws_cloudwatch_log_group" "firewall_logs" {
  name              = "/aws/network-firewall/${var.name_prefix}"
  retention_in_days = 30
}
