variable "email_address" {
  type        = string
  description = "Oracle account email address"
}

variable "tenancy_ocid" {
  type        = string
  description = "Oracle-assigned unique ID for Tenancy"
}

variable "user_ocid" {
  type        = string
  description = "Oracle-assigned unique ID for a User account"
}

variable "private_key_path" {
  type        = string
  description = "The path to the private key (.pem) file that corresponds to the public key you uploaded for the User account"
  default     = "~/.oci/oci_api_key.pem"
}

variable "fingerprint" {
  type        = string
  description = "Fingerprint of the public key (.pem) file"
}

variable "region" {
  type        = string
  description = "Oracle Cloud data center location (e.g., us-phoenix-1)"
}

variable "compartment_ocid" {
  description = "Oracle-assigned unique ID for Compartment this resource will belong to"
}

variable "repository_names" {
  type        = list(string)
  description = "Specifies the names of repositories that will be created within Oracle Cloud Image Registry"
  default     = ["build-service", "supply-chain"]
}

variable "is_immutable" {
  description = "Whether the repository is immutable. Images cannot be overwritten in an immutable repository."
  default     = true
}

variable "is_public" {
  description = "Whether the repository is public. A public repository allows unauthenticated access."
  default     = false
}