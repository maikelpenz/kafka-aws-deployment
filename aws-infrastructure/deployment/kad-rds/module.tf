data "terraform_remote_state" "kad-vpc" {
  backend = "s3"
  config = {
    bucket  = "${var.terraform_deployment_bucket}"
    key     = "kad-vpc/terraform.tfstate"
    region  = "${var.aws_region}"
    profile = "${var.aws_profile}"
  }
}

data "terraform_remote_state" "kad-ecs" {
  backend = "s3"
  config = {
    bucket  = "${var.terraform_deployment_bucket}"
    key     = "kad-ecs/terraform.tfstate"
    region  = "${var.aws_region}"
    profile = "${var.aws_profile}"
  }
}

module "kad-rds" {
  source                    = "../../modules/kad-rds"
  ecs_security_group        = "${data.terraform_remote_state.kad-ecs.outputs.ecs-security-group}"
  machine_public_ip_address = "${var.machine_public_ip_address}"
  vpc_id                    = "${data.terraform_remote_state.kad-vpc.outputs.kad-vpc}"
  subnet_ids                = ["${data.terraform_remote_state.kad-vpc.outputs.kad-public-subnet-a}", "${data.terraform_remote_state.kad-vpc.outputs.kad-public-subnet-b}", "${data.terraform_remote_state.kad-vpc.outputs.kad-public-subnet-c}"]
  db_name                   = "${var.db_name}"
  db_engine                 = "${var.db_engine}"
  db_family                 = "${var.db_family}"
  db_engine_version         = "${var.db_engine_version}"
  db_instance_type          = "${var.db_instance_type}"
  db_allocated_storage      = "${var.db_allocated_storage}"
  db_username               = "${var.db_username}"
  db_password               = "${var.db_password}"
  db_port                   = "${var.db_port}"
  db_publicly_accessible    = "${var.db_publicly_accessible}"
  db_deletion_protection    = "${var.db_deletion_protection}"
}
