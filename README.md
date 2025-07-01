This project is a simple microservice that provides current weather data for a given location. The service fetches data from the Open-Meteo API and exposes it through a REST API endpoint.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region where resources will be created | `string` | `"us-east-2"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `string` | `"weather-cluster"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The version of Kubernetes for the EKS cluster | `string` | `"1.24"` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | The desired capacity of the node group | `number` | `2` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type for the node group | `string` | `"t3.medium"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The name of the SSH key pair to use for EC2 instances | `string` | `null` | no |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | The maximum capacity of the node group | `number` | `3` | no |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | The minimum capacity of the node group | `number` | `1` | no |
| <a name="input_node_group_key_name"></a> [node\_group\_key\_name](#input\_node\_group\_key\_name) | The name of the SSH key pair to use for EC2 instances in the node group | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The list of subnet IDs for the EKS cluster | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC where the cluster will be deployed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_cluster_endpoint"></a> [eks\_cluster\_endpoint](#output\_eks\_cluster\_endpoint) | The endpoint for the EKS cluster |
| <a name="output_eks_cluster_name"></a> [eks\_cluster\_name](#output\_eks\_cluster\_name) | The name of the EKS cluster |
| <a name="output_eks_cluster_security_group_id"></a> [eks\_cluster\_security\_group\_id](#output\_eks\_cluster\_security\_group\_id) | The security group ID for the EKS cluster |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | Kubeconfig file to access the EKS cluster |
<!-- END_TF_DOCS -->




 awk '{print $1}' | tail -n +2); do echo "=== $project ==="; oc project $project; oc status | tail -2; done

for project in $(oc get projects | grep -v -E "openshift|kube|redhat|amq|3scale|ibm|service-registry|inspire|keda|istio|nfs|oadp|unleash|costmanagement|conduktor|knative|default|datamasque|jenkins" | awk '{print $1}' | tail -n +2); do echo "=== $project ==="; oc project $project; echo "Latest Deployment:"; oc get dc --sort-by=.metadata.creationTimestamp | tail -1 2>/dev/null; echo "Pods and Container IDs:"; oc get pods -o jsonpath='{range .items[*]}{"Pod: "}{.metadata.name}{"\n"}{range .status.containerStatuses[*]}{"  Container ID: "}{.containerID}{"\n"}{end}{"\n"}{end}' 2>/dev/null; done
for project in $(oc get projects | grep -v -E "openshift|kube|redhat|amq|3scale|ibm|service-registry|inspire|keda|istio|nfs|oadp|unleash|costmanagement|conduktor|knative|default|datamasque|jenkins" | awk '{print $1}' | tail -n +2); do echo "=== $project ==="; oc project $project; oc status; echo "Container Details:"; oc get pods -o custom-columns=NAME:.metadata.name,STATUS:.status.phase,READY:.status.conditions[?(@.type==\"Ready\")].status --no-headers 2>/dev/null || echo "No pods found"; done

for project in $(oc get projects | grep -v -E "openshift|kube|redhat|amq|3scale|ibm|service-registry|inspire|keda|istio|nfs|oadp|unleash|costmanagement|conduktor|knative|default|datamasque|jenkins" | awk '{print $1}' | tail -n +2); do echo "=== $project ==="; oc project $project; oc status; echo "Pods:"; oc get pods; echo "Container IDs (running pods only):"; oc describe pods | grep "Container ID" 2>/dev/null; done
