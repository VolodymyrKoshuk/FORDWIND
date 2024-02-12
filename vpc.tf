# VPC

module "vpc_fordwind" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.2"

  name       = var.vpc_name
  cidr       = var.cidr_of_vpc
  create_igw = var.igw_vpc

  # Configuration of AZ and Subnet of vpc
  azs                  = var.azs_vpc
  public_subnet_names  = var.public_subnet_name
  public_subnets       = var.cidr_public_subnet
  private_subnet_names = var.private_subnet_name
  private_subnets      = var.cidr_private_subnet

  # Configuration NAT Gateway of VPC
  enable_nat_gateway     = var.create_nat_gw
  single_nat_gateway     = var.single_nat_gw
  one_nat_gateway_per_az = var.one_nat_gw_per_azs

  # Configuration default security group of vpc
  default_security_group_name    = var.def_sg_name
  default_security_group_ingress = var.def_sg_ingress
  default_security_group_egress  = var.def_sg_egress

  # Configuration of tags inside a VPC
  tags             = var.main_tags_of_vpc
  igw_tags         = var.igw_tags_of_vpc
  nat_eip_tags     = var.nat_eip_tags_of_vpc
  nat_gateway_tags = var.nat_tags_of_vpc
}
