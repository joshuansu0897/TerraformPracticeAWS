resource "aws_internet_gateway" "gateway" {
  vpc_id = var.vpc_main_id
  tags = {
    Name = "Internet Gateway"
  }
}

resource "aws_route_table" "route_table_public" {
  vpc_id = var.vpc_main_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "FrontEnd Subnet"
  }
}

resource "aws_route_table_association" "route_table_public_association" {
  count          = length(var.public_subnets)
  subnet_id      = element(var.public_subnets.*.id, count.index)
  route_table_id = aws_route_table.route_table_public.id
  depends_on     = [aws_route_table.route_table_public]
}

resource "aws_eip" "nat" {
  count = length(var.public_subnets)
  vpc   = true
}
