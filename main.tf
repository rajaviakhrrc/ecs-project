
provider "aws" {
version = "~> 2.0"
region = "var.region"
}

locals {
  environment = lookup(var.workspace_to_environment_map, terraform.workspace, "dev")
}

module "my_backend"{
  source = "../module/backend"
  
  variable "bucket" {}
variable "name" {}
variable "billing_mode" {}
variable "hash_key" {}  
}

