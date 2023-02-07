data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name                 = "${var.infra_prefix}-vpc"
  cidr                 = var.vpc_cidr
  enable_dns_hostnames = true

  azs = [
    data.aws_availability_zones.available.names[0],
    data.aws_availability_zones.available.names[1],
    data.aws_availability_zones.available.names[2]
  ]

  private_subnets = [
    "${cidrsubnet(var.vpc_cidr, 2, 0)}",
    "${cidrsubnet(var.vpc_cidr, 2, 1)}",
    "${cidrsubnet(var.vpc_cidr, 2, 2)}"
  ]

  tags = var.default_tags

  private_subnet_tags = {
    type = "private"
  }
}
