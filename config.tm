globals {
  terraform_aws_provider_version = "~> 4.47"
}

generate_hcl "_terramate_generated_config.tf" {
  content {
    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = global.terraform_aws_provider_version
        }
      }
    backend "s3" {
    }
    }

    provider "aws" {
      region = "${var.region}"
      
      assume_role {
        role_arn = "arn:aws:iam::${var.accounts[terramate.stack.path.basename]}:role/${var.github_role_name}"
      }
    }
  }
}