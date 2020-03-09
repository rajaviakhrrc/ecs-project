#vpc variable.tf

variable "enviroment"{
  default = "test"
}
variable "vpc_name"{
  default = "my_test_vpc"
}

variable "vpc_cidr"{
 default = "10.0.0.0/16"
}
variable "sub_private_name" {
  default = "my_test_private_sub"
 
}
variable = "sub_private_cidr_1"{
 default = "10.0.0.0/24"
}
variable = "sub_private_cidr_2"{
  default = "10.0.1.0/24"
}
variable "sub_public_name"{
  default = "my_test_public_sub"
}
variable = "sub_public_cidr_1"{
  default = "10.0.10.0/24" 
 }
variable = "sub_public_cidr_2"{
  default = "10.0.11.0/24"
}


