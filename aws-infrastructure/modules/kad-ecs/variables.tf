variable "msk_bootstrap_brokers" {
  description = "msk brokers"
}
variable "machine_public_ip_address" {
  description = "Your machine public IP address to access resources outside AWS"
}

variable "vpc_id" {
  description = "AWS VPC for deployment"
}

variable "subnet_ids" {
  description = "VPC Subnets"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
}

variable "ecs_instance_type" {
  description = "EC2 instance type for ECS instances"
}

variable "ecs_image_id" {
  description = "ECS image ID"
}

variable "ecs_key_name" {
  description = "ECS EC2 instance key pair name"
}

variable "ecs_desired_capacity" {
  description = "ECS EC2 desired number of instances"
}

variable "ecs_min_size" {
  description = "ECS EC2 minimum number of instances"
}

variable "ecs_max_size" {
  description = "ECS EC2 maximum number of instances"
}

variable "ecs_container_kafka_schema_registry_port" {
  description = "kafka schema registry port (ECS Container)"
}

variable "ecs_host_kafka_schema_registry_port" {
  description = "kafka schema registry port for UI access (ECS Host)"
}

variable "ecs_container_kafka_connect_port" {
  description = "kafka connect port (ECS Container)"
}

variable "ecs_host_kafka_connect_port" {
  description = "kafka connect port for UI access (ECS Host)"
}

variable "ecs_alb_kafka_schema_registry_ui_port" {
  description = "kafka schema registry port for UI access (Load Balancer)"
}

variable "ecs_container_kafka_schema_registry_ui_port" {
  description = "kafka schema registry port for UI access (ECS Container)"
}

variable "ecs_host_kafka_schema_registry_ui_port" {
  description = "kafka schema registry port for UI access (ECS Host)"
}

variable "ecs_alb_kafka_connect_ui_port" {
  description = "kafka connect port for UI access (Load Balancer)"
}

variable "ecs_container_kafka_connect_ui_port" {
  description = "kafka connect port for UI access (ECS Container)"
}

variable "ecs_host_kafka_connect_ui_port" {
  description = "kafka connect port for UI access (ECS Host)"
}

variable "ecs_alb_kafka_rest_api_port" {
  description = "kafka rest api access (Load Balancer)"
}

variable "ecs_container_kafka_rest_api_port" {
  description = "kafka rest api access (ECS Container)"
}

variable "ecs_host_kafka_rest_api_port" {
  description = "kafka rest api access (ECS Host)"
}

variable "ecs_container_kafka_ksql_port" {
  description = "kafka Ksql port (ECS Container)"
}

variable "ecs_host_kafka_ksql_port" {
  description = "kafka Ksql port for UI access (ECS Host)"
}

variable "image_kafka_schema_registry" {
  description = "Docker image for Schema Registry"
}

variable "image_kafka_schema_registry_ui" {
  description = "Docker image for Schema Registry UI"
}

variable "image_kafka_connect" {
  description = "Docker image for Kafka Connect"
}

variable "image_kafka_connect_ui" {
  description = "Docker image for Kafka Connect UI"
}

variable "image_kafka_rest_api" {
  description = "Docker image for Kafka Rest API"
}

variable "image_kafka_ksql" {
  description = "Docker image for Kafka Ksql"
}