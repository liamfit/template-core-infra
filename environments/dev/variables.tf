variable "region" {
  type    = string
}

variable "infra_prefix" {
  type    = string
}

variable "default_tags" {
  type = map(any)
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "accounts" {
  type = map(any)
}

variable "github_role_name" {
  type = string
}
