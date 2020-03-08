
provider "aws" {
version = "~> 2.0"
region = "var.region"
}

module "my_backend"{
  source = "../module/backend"
  
  variable "bucket" {}
variable "name" {}
variable "billing_mode" {}
variable "hash_key" {}  
}

