# GLOBAL

variable "terraform_deployment_bucket" {
  description = "Bucket for MSK's state file. Needed to import msk list of brokers"
}

variable "aws_region" {
  description = "AWS Region for deployment"
}
variable "aws_profile" {
  description = "AWS Profile for deployment"
}

variable "machine_public_ip_address" {
  description = "Your machine public IP address to access resources outside AWS"
}