terraform {
  required_version = ">= 1.6.0, < 2.0.0"  # Specify the Terraform CLI version range

  required_providers {
    oci = {
      source = "oracle/oci"
      version = "~> 5.33.0"  # Should match what's in providers.tf
    }
  }
}
