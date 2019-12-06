resource "aws_service_discovery_private_dns_namespace" "kad-service-discovery" {
  name = "ecs.local"
  vpc  = var.vpc_id
}

resource "aws_service_discovery_service" "kad-kafka-schema-registry" {
  name = "kad-kafka-schema-registry"
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.kad-service-discovery.id
    dns_records {
      ttl  = 10
      type = "A"
    }
  }
  health_check_custom_config {
    failure_threshold = 1
  }
}

resource "aws_service_discovery_service" "kad-kafka-connect" {
  name = "kad-kafka-connect"
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.kad-service-discovery.id
    dns_records {
      ttl  = 10
      type = "A"
    }
  }
  health_check_custom_config {
    failure_threshold = 1
  }
}

resource "aws_service_discovery_service" "kad-kafka-ksql" {
  name = "kad-kafka-ksql"
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.kad-service-discovery.id
    dns_records {
      ttl  = 10
      type = "A"
    }
  }
  health_check_custom_config {
    failure_threshold = 1
  }
}