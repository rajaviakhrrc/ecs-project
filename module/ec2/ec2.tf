resource "aws_instance" "ec2instance"{
ami = "${var.ami}"
instance_type = "${var.instancetype}"
vpc_id = "${aws_vpc.mynetworkvpc.id}"
security_group_id = "${aws_security_group.akhilsg.id}"

tags = {
Name = "${var.ec2name}"
}
}
