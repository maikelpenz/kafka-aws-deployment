terraform init -backend-config="../../configuration/terraform-backend.tfvars"

terraform apply -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/vpc-config.tfvars"
terraform destroy -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/vpc-config.tfvars"