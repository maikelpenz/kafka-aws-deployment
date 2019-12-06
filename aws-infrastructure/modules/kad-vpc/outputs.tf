output "kad-vpc" {
  description = "Kad VPC"
  value       = "${aws_vpc.kad-vpc.id}"
}

output "kad-public-subnet-a" {
  description = "Public Subnet a"
  value       = "${aws_subnet.kad-public-subnet-a.id}"
}

output "kad-public-subnet-b" {
  description = "Public Subnet b"
  value       = "${aws_subnet.kad-public-subnet-b.id}"
}

output "kad-public-subnet-c" {
  description = "Public Subnet c"
  value       = "${aws_subnet.kad-public-subnet-c.id}"
}