output "vpc_main_id" {
  value = aws_vpc.main.id
  description = "Is the ID of main VPC"
}

output "public_subnets" {
  value = aws_subnet.public_subnets
  description = "Is the list of publics subnets"
}

output "private_subnets" {
  value = aws_subnet.private_subnets
  description = "Is the list of privates subnets"
}