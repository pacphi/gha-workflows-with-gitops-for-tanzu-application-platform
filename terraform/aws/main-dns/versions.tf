terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.3.1"
    }
  }
  required_version = ">= 0.14"
}
