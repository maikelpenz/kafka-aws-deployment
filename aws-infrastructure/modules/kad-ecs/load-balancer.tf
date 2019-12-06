resource "aws_security_group" "kad-ecs-application-lb" {
  name        = "kad-ecs-application-lb"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.machine_public_ip_address]
    description = "Machine public IP address"
  }
  egress {
    description = "all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "kad-ecs-application-lb" {
  name               = "kad-ecs-application-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.kad-ecs-application-lb.id]
  subnets            = var.subnet_ids
}

resource "aws_lb_target_group" "kad-ecs-kafka-schema-registry-ui" {
  name     = "kad-ecs-kafka-schema-registry-ui"
  port     = var.ecs_host_kafka_schema_registry_ui_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  depends_on = [aws_lb.kad-ecs-application-lb]
}

resource "aws_lb_listener" "kad-ecs-kafka-schema-registry-ui" {
  load_balancer_arn = aws_lb.kad-ecs-application-lb.arn
  port              = var.ecs_alb_kafka_schema_registry_ui_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kad-ecs-kafka-schema-registry-ui.arn
  }
}

resource "aws_lb_target_group" "kad-ecs-kafka-connect-ui" {
  name     = "kad-ecs-kafka-connect-ui"
  port     = var.ecs_host_kafka_connect_ui_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  depends_on = [aws_lb.kad-ecs-application-lb]
}

resource "aws_lb_listener" "kad-ecs-kafka-connect-ui" {
  load_balancer_arn = aws_lb.kad-ecs-application-lb.arn
  port              = var.ecs_alb_kafka_connect_ui_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kad-ecs-kafka-connect-ui.arn
  }
}

resource "aws_lb_target_group" "kad-ecs-kafka-rest-api" {
  name     = "kad-ecs-kafka-rest-api"
  port     = var.ecs_host_kafka_rest_api_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  depends_on = [aws_lb.kad-ecs-application-lb]
}

resource "aws_lb_listener" "kad-ecs-kafka-rest-api" {
  load_balancer_arn = aws_lb.kad-ecs-application-lb.arn
  port              = var.ecs_alb_kafka_rest_api_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kad-ecs-kafka-rest-api.arn
  }
}