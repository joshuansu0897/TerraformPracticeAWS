resource "aws_nat_gateway" "nat" {
  count         = length(var.public_subnets)
  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(var.public_subnets.*.id, count.index)
  depends_on    = [aws_internet_gateway.gateway]
}

resource "aws_route_table" "route_table_private" {
  count  = length(aws_nat_gateway.nat)
  vpc_id = var.vpc_main_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.nat.*.id, count.index)
  }

  tags = {
    Name = "BackEnd Subnet - ${count.index + 1}"
  }
}

resource "aws_route_table_association" "route_table_private_association" {
  count          = length(var.private_subnets)
  subnet_id      = element(var.private_subnets.*.id, count.index)
  route_table_id = element(aws_route_table.route_table_private.*.id, count.index)
  depends_on     = [aws_route_table.route_table_private]
}
