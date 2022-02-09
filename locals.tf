# -----------------------------------------------------------
# set up the Locals used by the rest of the configuration
# -----------------------------------------------------------

locals {
  # cidr should be a /16 in this instance
  private_network = cidrsubnet(var.cidr, 1, 1)
  public_network  = cidrsubnet(var.cidr, 2, 0)
  db_network      = cidrsubnet(var.cidr, 3, 3)
  name            = "Socure Example"

  # s3 bucket names
  s3_flow_log_bucket_name = "flow-logs-bucket-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}"
  s3_config_bucket_name   = "config-bucket-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}"
}
