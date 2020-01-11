output "elb_dns_name_public" {
  value = aws_elb.public_elb.dns_name
}

output "elb_dns_name_private" {
  value = aws_elb.private_elb.dns_name
}

output "private_sg_id" {
  value = aws_security_group.private_sg.id
}
