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