## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


provider "oci" {
region = var.region
tenancy_ocid = var.tenancy_ocid
user_ocid = var.user_ocid
fingerprint = var.fingerprint
private_key_path = var.private_key_path
}

provider "oci" {
  alias        = "home_region"
  tenancy_ocid = var.tenancy_ocid
  region       = lookup(data.oci_identity_regions.home_region.regions[0], "name")
}

provider "oci" {
  alias        = "current_region"
  tenancy_ocid = var.tenancy_ocid
  region       = var.region
}
