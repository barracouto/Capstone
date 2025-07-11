provider "aws" {
  region = "us-east-1"
}

data "aws_organizations_organization" "this" {}

resource "aws_organizations_policy" "deny_regions" {
  name        = "DenyUnsupportedRegions"
  description = "Deny access to regions outside us-east-1 and us-east-2"
  content     = file("${path.module}/scp-deny-regions.json")
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "deny_regions_root" {
  policy_id = aws_organizations_policy.deny_regions.id
  target_id = data.aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_policy" "deny_open_ports" {
  name        = "DenyAllPortsFromAnywhere"
  description = "Blocks 0.0.0.0/0 if all ports are open"
  content     = file("${path.module}/scp-deny-open-sg.json")
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "deny_open_ports_root" {
  policy_id = aws_organizations_policy.deny_open_ports.id
  target_id = data.aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_policy" "deny_root_user" {
  name        = "DenyRootUserAccess"
  description = "Blocks any usage of the AWS root user"
  content     = file("${path.module}/scp-deny-root-user-access.json")
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "deny_root_user_root" {
  policy_id = aws_organizations_policy.deny_root_user.id
  target_id = data.aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_policy" "require_ebs_encryption" {
  name        = "RequireEBSEncryption"
  description = "Requires all EBS volumes to be encrypted"
  content     = file("${path.module}/scp-require-ebs-encryption.json")
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "require_ebs_encryption_root" {
  policy_id = aws_organizations_policy.require_ebs_encryption.id
  target_id = data.aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_policy" "deny_leaving_org" {
  name        = "DenyLeavingOrg"
  description = "Prevents accounts from leaving the AWS Organization"
  content     = file("${path.module}/scp-deny-leaving-org.json")
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "deny_leaving_org_root" {
  policy_id = aws_organizations_policy.deny_leaving_org.id
  target_id = data.aws_organizations_organization.this.roots[0].id
}
