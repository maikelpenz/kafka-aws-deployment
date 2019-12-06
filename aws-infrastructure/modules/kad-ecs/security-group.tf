resource "aws_security_group" "kad-ecs" {
  name        = var.ecs_cluster_name
  description = "ecs cluster security group"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.kad-ecs-application-lb.id]
    description     = "Application Load Balancer"
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "from itself"
  }

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = [var.machine_public_ip_address]
    description = "Access from Local machine"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}