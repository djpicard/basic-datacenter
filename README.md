<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_config_bucket"></a> [s3\_config\_bucket](#module\_s3\_config\_bucket) | terraform-aws-modules/s3-bucket/aws | ~> 2.13 |
| <a name="module_s3_flow_log_bucket"></a> [s3\_flow\_log\_bucket](#module\_s3\_flow\_log\_bucket) | terraform-aws-modules/s3-bucket/aws | ~> 2.13 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | >=3.12.0 |

## Resources

| Name | Type |
|------|------|
| [aws_config_configuration_recorder.config_recorder](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder) | resource |
| [aws_config_configuration_recorder_status.config_recorder_status](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder_status) | resource |
| [aws_config_conformance_pack.cis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_conformance_pack) | resource |
| [aws_config_delivery_channel.config_channel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_delivery_channel) | resource |
| [aws_iam_role.config_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.config_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.read_only_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket_policy.config_logging_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_security_group.vpc_tls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.flow_log_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | List of availabe AZ within the region | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1c",<br>  "us-east-1d"<br>]</pre> | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | Default CIDR block to use for the VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_create_igw"></a> [create\_igw](#input\_create\_igw) | When set to 'true' a IGW will be created in the VPC | `bool` | `true` | no |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | When set to 'true' a NAT GW will be created in the VPC | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | Region to deploy resources | `string` | `"us-east-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of all tags to add to resources | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
