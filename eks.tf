module "eks_fordwind" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.2.1"

  cluster_name    = var.eks_cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access = true

  vpc_id     = module.vpc_fordwind.vpc_id
  subnet_ids = module.vpc_fordwind.private_subnets

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_type = ["t3.micro"]
      volume_size   = 8

      min_size     = 1
      max_size     = 3
      desired_size = 2

      tags = {
        Name        = "Node_from_group_#1"
        Terraform   = true
        Node_groupe = "1"
      }
    }

    two = {
      name = "node-groupe-2"

      instance_type = ["t3.micro"]
      volume_size   = 8

      min_size     = 1
      max_size     = 2
      desired_size = 1

      tags = {
        Name        = "Node_from_group_#2"
        Terraform   = true
        Node_groupe = "2"
      }
    }
  }

}
