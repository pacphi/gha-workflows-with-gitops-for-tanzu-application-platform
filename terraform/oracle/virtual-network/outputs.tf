output "vcn-ocid" {
  description = "OCID of the VCN that is created"
  value       = oci_core_vcn.vcn.id
}

output "nat-gateway-ocid" {
  description = "OCID for NAT gateway"
  value       = oci_core_nat_gateway.natgw.id
}

output "internet-gateway-id" {
  description = "OCID for Internet gateway"
  value       = oci_core_internet_gateway.igw.id
}

output "bastion-subnet-ocid" {
  description = "OCID for Bastion Host subnet"
  value       = oci_core_subnet.lb_subnet.id
}

output "k8s-lb-subnet-ocid" {
  description = "OCID for Kubernetes LB subnet"
  value       = oci_core_subnet.lb_subnet.id
}

output "k8s-api-endpoint-subnet-ocid" {
  description = "OCID for Kubernetes API endpoint subnet"
  value       = oci_core_subnet.api_endpoint_subnet.id
}

output "k8s-node-pool-subnet-ocid" {
  description = "OCID for Kubernetes Node Pool subnet"
  value       = oci_core_subnet.nodepool_subnet.id
}
