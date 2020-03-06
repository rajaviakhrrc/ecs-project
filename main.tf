
provider "aws" {
version = "~> 2.0"
region = "var.region"
}

module "my_backend"{
  source = "../module/backend"
  
}

