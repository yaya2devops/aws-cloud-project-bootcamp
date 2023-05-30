resource "aws_vpc" "cruddur_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "crdnetworkvpc"
  }
}

resource "aws_subnet" "public_subnet" {
  for_each                = { for idx, cidr in var.subnet_cidr_blocks : idx => cidr }
  vpc_id                  = aws_vpc.cruddur_vpc.id
  cidr_block              = each.value
  availability_zone       = var.availability_zones[each.key]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.stack_name}-SubnetPub${each.key + 1}"
  }
}
