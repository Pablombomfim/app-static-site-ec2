# PROVIDER
terraform {

  required_version = "~> 1.5.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.13"
    }
  }
}

  backend "s3" {
    bucket         = "tf-notifier-state-v1_do_pablinhos_gameplays"
    key            = "terraform.tfstate"
    dynamodb_table = "tf-notifier-state-v1_do_pablinhos-jogatinas"
    region         = "us-east-1"
}


provider "aws" {
  region                   = "us-east-1"
}
