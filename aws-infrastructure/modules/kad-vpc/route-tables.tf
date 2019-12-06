resource "aws_route_table" "kad-public-route-table" {
  vpc_id = aws_vpc.kad-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kad-internet-gateway.id
  }

  tags = {
    Name = "kad-public-route-table"
  }
}

resource "aws_route_table_association" "kad-public-route-table-public-subnet-a" {
  subnet_id      = aws_subnet.kad-public-subnet-a.id
  route_table_id = aws_route_table.kad-public-route-table.id
}

resource "aws_route_table_association" "kad-public-route-table-public-subnet-b" {
  subnet_id      = aws_subnet.kad-public-subnet-b.id
  route_table_id = aws_route_table.kad-public-route-table.id
}

resource "aws_route_table_association" "kad-public-route-table-public-subnet-c" {
  subnet_id      = aws_subnet.kad-public-subnet-c.id
  route_table_id = aws_route_table.kad-public-route-table.id
}