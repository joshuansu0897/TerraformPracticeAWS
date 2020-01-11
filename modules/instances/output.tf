output "elb_dns_name_public" {
  value       = aws_elb.public_elb.dns_name
  description = "Endpoint of the public ELB"
}

output "elb_dns_name_private" {
  value       = aws_elb.private_elb.dns_name
  description = "Endpoint of the private/internal ELB"
}

output "private_sg_id" {
  value       = aws_security_group.private_sg.id
  description = "ID of the private security group"
}
