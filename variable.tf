# Variables for version.tf file
variable "terr_region" {
  description = "Region where will be create all project"
  type        = string
  default     = "eu-north-1"
}

# Variables for vpc
variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "fordwind_vpc"
}

variable "cidr_of_vpc" {
  description = "Main CIDR block for VPC"
  type        = string
  default     = "10.7.0.0/16"
}

variable "igw_vpc" {
  description = "Create Internet GW for VPC (true or false)"
  type        = bool
  default     = true
}


# Configuration of Subnet of vpc

variable "public_subnet_name" {
  description = "Name of public subnet"
  type        = list(string)
  default     = ["public-a", "public-b", "public-c"]
}

variable "cidr_public_subnet" {
  description = "CIDR block for public subnet"
  type        = list(string)
  default     = ["10.7.11.0/24", "10.7.21.0/24", "10.7.31.0/24"]
}

variable "private_subnet_name" {
  description = "Name of private subnet"
  type        = list(string)
  default     = ["private -a", "private -b", "private -c"]
}

variable "cidr_private_subnet" {
  description = "CIDR block for private subnet"
  type        = list(string)
  default     = ["10.7.12.0/24", "10.7.22.0/24", "10.7.32.0/24"]
}

# Configuration NAT Gateway of VPC

variable "create_nat_gw" {
  description = "Create NAT GW for VPC (true or false)"
  type        = bool
  default     = false
}

variable "single_nat_gw" {
  description = " Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}

variable "one_nat_gw_per_azs" {
  description = " Should be true if you want only one NAT Gateway per availability zone"
  type        = bool
  default     = false
}

variable "def_sg_name" {
  description = "Name of default security group"
  type        = string
  default     = "Default Security group of VPC fordwind"
}

variable "def_sg_ingress" {
  description = "Rules ingress for security group of VPC"
  type        = list(map(string))
  default     = []
}

variable "def_sg_egress" {
  description = "Rules egress for security group of VPC"
  type        = list(map(string))
  default = [{
    description = "Default egress SG"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "10.7.0.0/16"
  }]
}

# Configuration of tags inside a VPC

variable "main_tags_of_vpc" {
  description = "Map of main tags of vpc"
  type        = map(string)
  default = {
    Terraform  = true
    Education  = true
    Kubernetes = true
  }
}

variable "igw_tags_of_vpc" {
  description = "Map of tags of Intrnet Gateway of vpc"
  type        = map(string)
  default = {
    Name = "IGW_Fordwind"
  }
}

variable "nat_eip_tags_of_vpc" {
  description = "Map of tags of Elastic IP of vpc"
  type        = map(string)
  default = {
    Name = "EIP_Fordwind"
  }
}

variable "nat_tags_of_vpc" {
  description = "Map of tags of NAT of vpc"
  type        = map(string)
  default = {
    Name = "NAT_Fordwind"
  }
}


#Variables for EKS module

variable "eks_cluster_name" {
  description = "Name of eks cluster"
  type        = string
  default     = "Fordwind_cluster"
}

variable "cluster_version" {
  description = "Version of kubernetes cluster"
  type        = string
  default     = "1.29"
}
