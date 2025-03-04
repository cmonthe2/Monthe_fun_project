provider "aws" {
  region = var.aws_region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = var.subnet_ids
  vpc_id          = var.vpc_id

  # Optional: To manage node groups
  node_groups = {
    default = {
      desired_capacity = var.desired_capacity
      max_capacity     = var.max_capacity   
      min_capacity     = var.min_capacity

      instance_type = var.instance_type
      key_name      = var.node_group_key_name
    }
  }
}

output "kubeconfig" {
  value     = module.eks.kubeconfig
  sensitive = true
}
