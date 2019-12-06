deploykad:  deployvpc deploymsk  deployecs  deployrds
destroykad: destroyrds destroyecs destroymsk destroyvpc

deployvpc:
	@echo Initializing VPC
	rm -rf aws-infrastructure/deployment/kad-vpc/.terraform
	(cd aws-infrastructure/deployment/kad-vpc; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd aws-infrastructure/deployment/kad-vpc; terraform apply -auto-approve -var-file="../../configuration/global-config.tfvars")
	rm -rf aws-infrastructure/deployment/kad-vpc/.terraform

destroyvpc:
	@echo Destroying VPC
	(cd aws-infrastructure/deployment/kad-vpc; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd aws-infrastructure/deployment/kad-vpc; terraform destroy -auto-approve -var-file="../../configuration/global-config.tfvars")
	rm -rf aws-infrastructure/deployment/kad-vpc/.terraform

deploymsk:
	@echo Initializing MSK
	rm -rf aws-infrastructure/deployment/kad-msk/.terraform
	(cd aws-infrastructure/deployment/kad-msk; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd aws-infrastructure/deployment/kad-msk; terraform apply -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/msk-config.tfvars")
	rm -rf aws-infrastructure/deployment/kad-msk/.terraform

destroymsk:
	@echo Destroying MSK
	(cd aws-infrastructure/deployment/kad-msk; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd aws-infrastructure/deployment/kad-msk; terraform destroy -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/msk-config.tfvars")
	rm -rf aws-infrastructure/deployment/kad-msk/.terraform

deployecs:
	@echo Initializing ECS
	rm -rf aws-infrastructure/deployment/kad-ecs/.terraform
	(cd aws-infrastructure/deployment/kad-ecs; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd aws-infrastructure/deployment/kad-ecs; terraform apply -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/ecs-config.tfvars")
	rm -rf aws-infrastructure/deployment/kad-ecs/.terraform

destroyecs:
	@echo Destroying ECS
	(cd aws-infrastructure/deployment/kad-ecs; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd aws-infrastructure/deployment/kad-ecs; terraform destroy -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/ecs-config.tfvars")
	rm -rf aws-infrastructure/deployment/kad-ecs/.terraform

deployrds:
	@echo Initializing RDS
	rm -rf aws-infrastructure/deployment/kad-rds/.terraform
	(cd aws-infrastructure/deployment/kad-rds; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd aws-infrastructure/deployment/kad-rds; terraform apply -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/rds-config.tfvars")
	rm -rf aws-infrastructure/deployment/kad-rds/.terraform

destroyrds:
	@echo Destroying RDS
	(cd aws-infrastructure/deployment/kad-rds; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd aws-infrastructure/deployment/kad-rds; terraform destroy -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/rds-config.tfvars")
	rm -rf aws-infrastructure/deployment/kad-rds/.terraform