# PROVIDER
terraform {

  required_version = "~> 1.5.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.13"
    }
  }

#DynaboDb
module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = "tf-notifier-state-v1_do_pablinhos-jogatinas"
  hash_key = "LockID"

  attributes = [
    {
      name = "LockID"
      type = "N"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "staging"
  }
}

#bucketS3
resource "aws_s3_bucket" "tf-terraform-hello-world-state-pablinhos" {
  bucket = "tf-notifier-state-v1_do_pablinhos_gameplays"
}
}
