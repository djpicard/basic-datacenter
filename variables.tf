# -----------------------------------------------------------
# set up the Variables for the system
# -----------------------------------------------------------

variable "cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Default CIDR block to use for the VPC"
}

variable "azs" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1c", "us-east-1d"]
  description = "List of availabe AZ within the region"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Region to deploy resources"
}

variable "create_igw" {
  type        = bool
  default     = true
  description = "When set to 'true' a IGW will be created in the VPC"
}

variable "enable_nat_gateway" {
  type        = bool
  default     = true
  description = "When set to 'true' a NAT GW will be created in the VPC"
}

variable "encryption_enabled" {
  type        = bool
  default     = true
  description = "When set to 'true' the resource will have AES256 encryption enabled by default"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Map of all tags to add to resources"
}