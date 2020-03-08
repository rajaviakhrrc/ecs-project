#for backend statefile variabless

variable "bucket" {}
variable "name" {}
variable "billing_mode" {}
variable "hash_key" {}

#workspace variables

variable "workspace_to_environment_map" {
  type = map
  default = { 
    dev   = "dev"
    qa    = "qa"
    stage = "stage"
    prod  = "prod"
  }
}
