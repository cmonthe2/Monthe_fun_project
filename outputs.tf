output "kubeconfig" {
  description = "Kubeconfig file to access the EKS cluster"
  value       = module.eks.kubeconfig
  sensitive   = true
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_security_group_id" {
  description = "The security group ID for the EKS cluster"
  value       = module.eks.cluster_security_group_id
}
