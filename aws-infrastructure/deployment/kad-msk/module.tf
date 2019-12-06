data "terraform_remote_state" "kad-vpc" {
  backend = "s3"
  config = {
    bucket  = var.terraform_deployment_bucket
    key     = "kad-vpc/terraform.tfstate"
    region  = var.aws_region
    profile = var.aws_profile
  }
}

module "kad-msk" {
  source                         = "../../modules/kad-msk"
  vpc_id                         = "${data.terraform_remote_state.kad-vpc.outputs.kad-vpc}"
  msk_instance_type              = "${var.msk_instance_type}"
  subnet_ids                     = ["${data.terraform_remote_state.kad-vpc.outputs.kad-public-subnet-a}", "${data.terraform_remote_state.kad-vpc.outputs.kad-public-subnet-b}"]
  msk_kafka_version              = "${var.msk_kafka_version}"
  msk_number_of_brokers          = "${var.msk_number_of_brokers}"
  msk_ebs_volume_size            = "${var.msk_ebs_volume_size}"
  msk_encryption_data_in_transit = "${var.msk_encryption_data_in_transit}"
  msk_min_in_sync_replicas       = "${var.msk_min_in_sync_replicas}"
  msk_default_replication_factor = "${var.msk_default_replication_factor}"
  msk_configuration_name         = "${var.msk_configuration_name}"
}
