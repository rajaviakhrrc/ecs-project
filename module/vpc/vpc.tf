resource "aws_vpc" "mynetworkvpc"{
cidr_block = "${var.mycidr}"
tags = {
Name = "${var.myVpcName}"
}
}

