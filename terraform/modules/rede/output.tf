output "vpc_sn_public_id" {
    value = "${aws_subnet.sn_public.id}"
}

output "vpc_sg_pub_id" {
    value = "${aws_security_group.vpc_sg_pub.id}"
}