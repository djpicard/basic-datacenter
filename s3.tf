# -----------------------------------------------------------
# Create AWS S3 bucket for AWS Config to record configuration history and snapshots
# -----------------------------------------------------------
module "s3_config_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 2.13"

  bucket        = local.s3_config_bucket_name
  policy        = data.aws_iam_policy_document.flow_log_s3.json
  force_destroy = true

  tags = {
    Name = "aws-config-s3-bucket"
  }
}

resource "aws_s3_bucket_policy" "config_logging_policy" {
  bucket = module.s3_config_bucket.s3_bucket_id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowBucketAcl",
      "Effect": "Allow",
      "Principal": {
        "Service": [
         "config.amazonaws.com"
        ]
      },
      "Action": "s3:GetBucketAcl",
      "Resource": "arn:aws:s3:::${local.s3_config_bucket_name}",
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "true"
        }
      }
    },
    {
      "Sid": "AllowConfigWriteAccess",
      "Effect": "Allow",
      "Principal": {
        "Service": [
         "config.amazonaws.com"
        ]
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::${local.s3_config_bucket_name}/AWSLogs/${data.aws_caller_identity.current.account_id}/Config/*",
      "Condition": {
        "StringEquals": {
          "s3:x-amz-acl": "bucket-owner-full-control"
        },
        "Bool": {
          "aws:SecureTransport": "true"
        }
      }
    },
    {
      "Sid": "RequireSSL",
      "Effect": "Deny",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::${local.s3_config_bucket_name}/*",
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      }
    }
  ]
}
POLICY
}

# -----------------------------------------------------------
# Create AWS S3 bucket for the VPC Flow Logs
# -----------------------------------------------------------
module "s3_flow_log_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 2.13"

  bucket        = local.s3_flow_log_bucket_name
  policy        = data.aws_iam_policy_document.flow_log_s3.json
  force_destroy = true

  tags = {
    Name = "vpc-flow-logs-s3-bucket"
  }
}

data "aws_iam_policy_document" "flow_log_s3" {
  statement {
    sid = "AWSLogDeliveryWrite"

    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }

    actions = ["s3:PutObject"]

    resources = ["arn:aws:s3:::${local.s3_flow_log_bucket_name}/AWSLogs/*"]
  }

  statement {
    sid = "AWSLogDeliveryAclCheck"

    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }

    actions = ["s3:GetBucketAcl"]

    resources = ["arn:aws:s3:::${local.s3_flow_log_bucket_name}"]
  }
}
