resource "aws_internet_gateway" "kad-internet-gateway" {
  vpc_id = aws_vpc.kad-vpc.id

  tags = {
    Name  = "kad-internet-gateway"
  }
}