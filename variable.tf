variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "weather-cluster"
}

variable "cluster_version" {
  description = "The version of Kubernetes for the EKS cluster"
  type        = string
  default     = "1.24"
}

variable "vpc_id" {
  description = "The ID of the VPC where the cluster will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "The list of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "key_name" {
  description = "The name of the SSH key pair to use for EC2 instances"
  type        = string
  default     = null
}

variable "desired_capacity"{
  description = "The desired capacity of the node group"
  type        = number
  default     = 2
}

variable "max_capacity"{
  description = "The maximum capacity of the node group"
  type        = number
  default     = 3
}

variable "min_capacity"{
  description = "The minimum capacity of the node group"
  type        = number
  default     = 1
}
variable "instance_type" {
  description = "The instance type for the node group"
  type        = string
  default     = "t3.medium"
}
variable "node_group_key_name" {
  description = "The name of the SSH key pair to use for EC2 instances in the node group"
  type        = string
  default     = null
}
