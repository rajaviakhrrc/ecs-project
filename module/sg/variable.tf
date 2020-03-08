variable "cidrIsg" {
default = "0.0.0.0/0"
}

variable "cidrEsg" {
default = "0.0.0.0/0"
}

variable "fromIport"{
default = 443 
}

variable "fromEport"{
default = 22
}

variable "toIport"{
default = 443
}

variable "toEport"{
default = 22
}

variable "protocolIsg"{
default = "http"
}

variable "protocolEsg"{
default = "ssh"
}

variable "sgname"{
}
