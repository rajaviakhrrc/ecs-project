resource "aws_security_group" "akhilsg"{
vpc_id = "${aws_vpc.mynetworkvpc.id}"
ingress {
from_port = "${var.fromIport}"
to_port = "${var.toIport}"
protocol = "${var.protocolIsg}"
cidr_blocks = "${var.cidrIsg}" 
}
egress {
from_port = "${var.fromEport}"
to_port = "${ var.toEport}"
protocol = "${var.protocolEsg}"
cidr_blocks = "${var.cidrEsg}"
}
tags = {
Name = "${var.sgname}"
}
}
