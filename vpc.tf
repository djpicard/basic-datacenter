# -----------------------------------------------------------
# Resources and examples were used from the AWS Terraform VPC Module
#
# Examples can be found here: https://github.com/terraform-aws-modules/terraform-aws-vpc
# -----------------------------------------------------------

# -----------------------------------------------------------
# set up the AWS VPC, subnets, and default NACLs
# -----------------------------------------------------------
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">=3.12.0" # using the latest version

  name = local.name
  cidr = var.cidr
  azs  = var.azs

  # Create the subnets for a 3 az region
  private_subnets  = cidrsubnets(local.private_network, 2, 2, 2)
  public_subnets   = cidrsubnets(local.public_network, 2, 2, 2)
  database_subnets = cidrsubnets(local.db_network, 2, 2, 2)

  # Setup internet Inbound and Outbound network traffic
  create_igw         = var.create_igw
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = true

  # Setting up default NACL and Security Group
  manage_default_network_acl = true
  default_network_acl_tags   = { Name = "${local.name}-default" }

  manage_default_route_table = true
  default_route_table_tags   = { Name = "${local.name}-default" }

  manage_default_security_group = true
  default_security_group_tags   = { Name = "${local.name}-default" }

  # We are setting up a DB subnet
  create_database_subnet_group       = true
  create_database_subnet_route_table = true

  # Setup DNS Support within the VPC
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Setup VPC Flow Logs
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60

  tags = var.tags
}