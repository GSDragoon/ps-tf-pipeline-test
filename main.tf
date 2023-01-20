# main.tf contains the main Terraform resource and module definitions.
# This may be split out appropriately into separate `*.tf` files and documented in README.md under a section titled "File Structure".
# If splitting out main.tf, .terraform-docs.yml must be updated. See the checklist in README.md for more information.

resource "aws_vpc" "instance" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}
