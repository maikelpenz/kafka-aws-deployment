resource "aws_security_group" "kad-rds" {
  name        = "kad-rds"
  description = "kad-rds"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.machine_public_ip_address]
    description = "Machine public IP address"
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [var.ecs_security_group]
    description     = "Access From ECS cluster"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "kad-rds" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "kad-rds"

  engine               = var.db_engine
  engine_version       = var.db_engine_version
  major_engine_version = var.db_engine_version
  family               = var.db_family
  instance_class       = var.db_instance_type
  allocated_storage    = var.db_allocated_storage

  name                = var.db_name
  username            = var.db_username
  password            = var.db_password
  port                = var.db_port
  publicly_accessible = var.db_publicly_accessible

  vpc_security_group_ids = [aws_security_group.kad-rds.id]

  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 0

  tags = {
    Project = var.db_name
  }

  subnet_ids                = var.subnet_ids
  final_snapshot_identifier = var.db_name

  create_db_parameter_group = true
  deletion_protection       = var.db_deletion_protection

  parameters = [
    {
      name         = "rds.logical_replication"
      value        = "1"
      apply_method = "pending-reboot"
    }
  ]

  options = []

}
