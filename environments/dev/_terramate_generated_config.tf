// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.47"
    }
  }
  backend "s3" {
  }
}
provider "aws" {
  region = "${var.region}"
  assume_role {
    role_arn = "arn:aws:iam::${var.accounts["dev"]}:role/${var.github_role_name}"
  }
}
