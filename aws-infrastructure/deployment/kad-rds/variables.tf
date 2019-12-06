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

# RDS

variable "db_name" {
  description = "RDS database name"
}

variable "db_engine" {
  description = "RDS database engine"
}

variable "db_family" {
  description = "RDS database family"
}

variable "db_engine_version" {
  description = "RDS database engine version"
}

variable "db_instance_type" {
  description = "RDS database instance type"
}

variable "db_allocated_storage" {
  description = "RDS database allocated storage"
}

variable "db_username" {
  description = "RDS database username"
}

variable "db_password" {
  description = "RDS database password"
}

variable "db_port" {
  description = "RDS database port"
}

variable "db_publicly_accessible" {
  description = "Defines if RDS database is available out of AWS"
}

variable "db_deletion_protection" {
  description = "Prevents a RDS database instance from being deleted"
}