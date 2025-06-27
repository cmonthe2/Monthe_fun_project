FROM python:3.9-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

CMD ["python", "app.py"]

1. Inventory and Planning
First, create an inventory of your current deployments:


# Get all deployments across namespaces with their current images
oc get deployments --all-namespaces -o jsonpath='{range .items[*]}{.metadata.namespace}{"\t"}{.metadata.name}{"\t"}{.spec.template.spec.containers[*].image}{"\n"}{end}'

# For DeploymentConfigs
oc get dc --all-namespaces -o jsonpath='{range .items[*]}{.metadata.namespace}{"\t"}{.metadata.name}{"\t"}{.spec.template.spec.containers[*].image}{"\n"}{end}'


2. Automated Update Strategies
Option A: Using oc patch for bulk updates
Create a script to update images systematically:

#!/bin/bash
# update-images.sh

# Define your image mappings
declare -A IMAGE_MAPPINGS=(
    ["old-registry.com/folder1/app1:v1.0"]="jfrog.company.com/folder1/app1:v2.0"
    ["old-registry.com/folder2/app2:v1.5"]="jfrog.company.com/folder2/app2:v3.0"
)

# Function to update deployment
update_deployment() {
    local namespace=$1
    local deployment=$2
    local old_image=$3
    local new_image=$4
    
    echo "Updating $namespace/$deployment: $old_image -> $new_image"
    oc patch deployment $deployment -n $namespace -p '{"spec":{"template":{"spec":{"containers":[{"name":"'$deployment'","image":"'$new_image'"}]}}}}'
}

# Iterate through all deployments
for ns in $(oc get namespaces -o name | cut -d/ -f2); do
    for deployment in $(oc get deployments -n $ns -o name | cut -d/ -f2); do
        current_image=$(oc get deployment $deployment -n $ns -o jsonpath='{.spec.template.spec.containers[0].image}')
        
        if [[ ${IMAGE_MAPPINGS[$current_image]} ]]; then
            update_deployment $ns $deployment $current_image ${IMAGE_MAPPINGS[$current_image]}
        fi
    done
done
