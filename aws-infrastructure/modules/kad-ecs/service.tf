resource "aws_ecs_service" "kad-kafka-schema-registry" {
  cluster                            = aws_ecs_cluster.kad-ecs.id
  desired_count                      = 1
  launch_type                        = "EC2"
  name                               = "kad-kafka-schema-registry"
  scheduling_strategy                = "REPLICA"
  task_definition                    = aws_ecs_task_definition.kad-kafka-schema-registry.arn

  service_registries {
    registry_arn   = aws_service_discovery_service.kad-kafka-schema-registry.arn
    container_name = "kad-kafka-schema-registry"
  }

  network_configuration {
    subnets          = var.subnet_ids
    assign_public_ip = false
    security_groups  = [aws_security_group.kad-ecs.id]
  }
}

resource "aws_ecs_service" "kad-kafka-connect" {
  cluster                            = aws_ecs_cluster.kad-ecs.id
  desired_count                      = 1
  launch_type                        = "EC2"
  name                               = "kad-kafka-connect"
  scheduling_strategy                = "REPLICA"
  task_definition                    = aws_ecs_task_definition.kad-kafka-connect.arn

  service_registries {
    registry_arn   = aws_service_discovery_service.kad-kafka-connect.arn
    container_name = "kad-kafka-connect"
  }

  network_configuration {
    subnets          = var.subnet_ids
    assign_public_ip = false
    security_groups  = [aws_security_group.kad-ecs.id]
  }
}

resource "aws_ecs_service" "kad-ecs-kafka-schema-registry-ui" {
  cluster                            = aws_ecs_cluster.kad-ecs.id
  desired_count                      = 1
  launch_type                        = "EC2"
  name                               = "kad-ecs-kafka-schema-registry-ui"
  scheduling_strategy                = "REPLICA"
  task_definition                    = aws_ecs_task_definition.kad-ecs-kafka-schema-registry-ui.arn

  load_balancer {
    target_group_arn = aws_lb_target_group.kad-ecs-kafka-schema-registry-ui.arn
    container_name   = "kad-ecs-kafka-schema-registry-ui"
    container_port   = var.ecs_container_kafka_schema_registry_ui_port
  }
}

resource "aws_ecs_service" "kad-ecs-kafka-connect-ui" {
  cluster                            = aws_ecs_cluster.kad-ecs.id
  desired_count                      = 1
  launch_type                        = "EC2"
  name                               = "kad-ecs-kafka-connect-ui"
  scheduling_strategy                = "REPLICA"
  task_definition                    = aws_ecs_task_definition.kad-ecs-kafka-connect-ui.arn

  load_balancer {
    target_group_arn = aws_lb_target_group.kad-ecs-kafka-connect-ui.arn
    container_name   = "kad-ecs-kafka-connect-ui"
    container_port   = var.ecs_container_kafka_connect_ui_port
  }
}

resource "aws_ecs_service" "kad-ecs-kafka-rest-api" {
  cluster                            = aws_ecs_cluster.kad-ecs.id
  desired_count                      = 1
  launch_type                        = "EC2"
  name                               = "kad-ecs-kafka-rest-api"
  scheduling_strategy                = "REPLICA"
  task_definition                    = aws_ecs_task_definition.kad-ecs-kafka-rest-api.arn

  load_balancer {
    target_group_arn = aws_lb_target_group.kad-ecs-kafka-rest-api.arn
    container_name   = "kad-ecs-kafka-rest-api"
    container_port   = var.ecs_container_kafka_rest_api_port
  }
}

resource "aws_ecs_service" "kad-kafka-ksql" {
  cluster                            = aws_ecs_cluster.kad-ecs.id
  desired_count                      = 1
  launch_type                        = "EC2"
  name                               = "kad-kafka-ksql"
  scheduling_strategy                = "REPLICA"
  task_definition                    = aws_ecs_task_definition.kad-kafka-ksql.arn

  service_registries {
    registry_arn   = aws_service_discovery_service.kad-kafka-ksql.arn
    container_name = "kad-kafka-ksql"
  }

  network_configuration {
    subnets          = var.subnet_ids
    assign_public_ip = false
    security_groups  = [aws_security_group.kad-ecs.id]
  }
}
