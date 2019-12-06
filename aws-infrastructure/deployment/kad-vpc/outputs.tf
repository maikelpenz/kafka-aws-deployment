output "kad-vpc" {
  description = "Kad VPC"
  value       = "${module.kad-vpc.kad-vpc}"
}

output "kad-public-subnet-a" {
  description = "Public Subnet a"
  value       = "${module.kad-vpc.kad-public-subnet-a}"
}

output "kad-public-subnet-b" {
  description = "Public Subnet b"
  value       = "${module.kad-vpc.kad-public-subnet-b}"
}

output "kad-public-subnet-c" {
  description = "Public Subnet c"
  value       = "${module.kad-vpc.kad-public-subnet-c}"
}