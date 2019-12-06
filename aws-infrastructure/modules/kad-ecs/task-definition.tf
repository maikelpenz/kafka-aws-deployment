resource "aws_ecs_task_definition" "kad-kafka-schema-registry" {
  family                   = "kad-kafka-schema-registry"
  network_mode             = "awsvpc"
  requires_compatibilities = []
  tags                     = {}
  container_definitions = jsonencode(
    [
      {
        name : "kad-kafka-schema-registry"
        container_name : "kad-kafka-schema-registry"
        cpu = 0
        image = var.image_kafka_schema_registry
        essential   = true
        mountPoints = []
        volumesFrom = []
        memoryReservation : 1024
        portMappings : [
          {
            containerPort = var.ecs_container_kafka_schema_registry_port,
            hostPort      = var.ecs_host_kafka_schema_registry_port
            protocol : "tcp"
          }
        ],
        environment = [
          {
            name = "SCHEMA_REGISTRY_KAFKASTORE_BOOTSTRAP_SERVERS"
            value = "PLAINTEXT://${var.msk_bootstrap_brokers}"
          },
          {
            name  = "SCHEMA_REGISTRY_HOST_NAME"
            value = "kad-kafka-schema-registry"
          },
          {
            name  = "SCHEMA_REGISTRY_LISTENERS"
            value = "http://0.0.0.0:${var.ecs_container_kafka_schema_registry_port}"
          }
        ]
      }
  ])
}

resource "aws_ecs_task_definition" "kad-kafka-connect" {
  family                   = "kad-kafka-connect"
  network_mode             = "awsvpc"
  requires_compatibilities = []
  tags                     = {}
  container_definitions = jsonencode(
    [
      {
        name : "kad-kafka-connect"
        container_name : "kad-kafka-connect"
        cpu = 0
        image : var.image_kafka_connect
        essential   = true
        mountPoints = []
        volumesFrom = []
        memoryReservation : 1024
        portMappings : [
          {
            containerPort = var.ecs_container_kafka_connect_port,
            hostPort      = var.ecs_host_kafka_connect_port
            protocol : "tcp"
          }
        ],
        environment = [
          {
            name = "BOOTSTRAP_SERVERS"
            value = var.msk_bootstrap_brokers
          },
          {
            name  = "GROUP_ID"
            value = "kafka-connect-group"
          },
          {
            name  = "CONFIG_STORAGE_TOPIC"
            value = "kafka-connect-config"
          },
          {
            name  = "OFFSET_STORAGE_TOPIC"
            value = "kafka-connect-offset"
          },
          {
            name  = "STATUS_STORAGE_TOPIC"
            value = "kafka-connect-status"
          },
          {
            name  = "KEY_CONVERTER"
            value = "io.confluent.connect.avro.AvroConverter"
          },
          {
            name  = "VALUE_CONVERTER"
            value = "io.confluent.connect.avro.AvroConverter"
          },
          {
            name  = "INTERNAL_KEY_CONVERTER"
            value = "org.apache.kafka.connect.json.JsonConverter"
          },
          {
            name  = "INTERNAL_VALUE_CONVERTER"
            value = "org.apache.kafka.connect.json.JsonConverter"
          },
          {
            name  = "CONNECT_KEY_CONVERTER_SCHEMA_REGISTRY_URL"
            value = "http://kad-kafka-schema-registry.ecs.local:${var.ecs_container_kafka_schema_registry_port}"
          },
          {
            name  = "CONNECT_VALUE_CONVERTER_SCHEMA_REGISTRY_URL"
            value = "http://kad-kafka-schema-registry.ecs.local:${var.ecs_container_kafka_schema_registry_port}"
          }
        ]
      }
  ])
}

resource "aws_ecs_task_definition" "kad-ecs-kafka-schema-registry-ui" {
  family = "kad-ecs-kafka-schema-registry-ui"
  network_mode             = "bridge"
  requires_compatibilities = []
  tags                     = {}
  container_definitions = jsonencode(
    [
      {
        name : "kad-ecs-kafka-schema-registry-ui"
        container_name : "kad-ecs-kafka-schema-registry-ui"
        cpu = 0
        image : var.image_kafka_schema_registry_ui
        essential   = true
        mountPoints = []
        volumesFrom = []
        memoryReservation : 1024
        portMappings : [
          {
            containerPort = var.ecs_container_kafka_schema_registry_ui_port,
            hostPort      = var.ecs_host_kafka_schema_registry_ui_port
            protocol : "tcp"
          }
        ],
        environment = [
          {
            name  = "SCHEMAREGISTRY_URL"
            value = "http://kad-kafka-schema-registry.ecs.local:${var.ecs_container_kafka_schema_registry_port}/"
          },
          {
            name  = "PROXY"
            value = "true"
          }
        ]
      }
  ])
}

resource "aws_ecs_task_definition" "kad-ecs-kafka-connect-ui" {
  family = "kad-ecs-kafka-connect-ui"
  network_mode             = "bridge"
  requires_compatibilities = []
  tags                     = {}
  container_definitions = jsonencode(
    [
      {
        name : "kad-ecs-kafka-connect-ui"
        container_name : "kad-ecs-kafka-connect-ui"
        cpu = 0
        image : var.image_kafka_connect_ui
        essential   = true
        mountPoints = []
        volumesFrom = []
        memoryReservation : 1024
        portMappings : [
          {
            containerPort = var.ecs_container_kafka_connect_ui_port,
            hostPort      = var.ecs_host_kafka_connect_ui_port
            protocol : "tcp"
          }
        ],
        environment = [
          {
            name  = "CONNECT_URL"
            value = "http://kad-kafka-connect.ecs.local:${var.ecs_container_kafka_connect_port}"

          },
          {
            name  = "PROXY"
            value = "true"
          }
        ]
      }
  ])
}

resource "aws_ecs_task_definition" "kad-ecs-kafka-rest-api" {
  family                   = "kad-ecs-kafka-rest-api"
  network_mode             = "bridge"
  requires_compatibilities = []
  tags                     = {}
  container_definitions = jsonencode(
    [
      {
        name : "kad-ecs-kafka-rest-api"
        container_name : "kad-ecs-kafka-rest-api"
        cpu = 0
        image : var.image_kafka_rest_api
        essential   = true
        mountPoints = []
        volumesFrom = []
        memoryReservation : 1024
        portMappings : [
          {
            containerPort = var.ecs_container_kafka_rest_api_port,
            hostPort      = var.ecs_host_kafka_rest_api_port
            protocol : "tcp"
          }
        ],
        environment = [
          {
            name = "KAFKA_REST_BOOTSTRAP_SERVERS"
            value = "PLAINTEXT://${var.msk_bootstrap_brokers}"
          },
          {
            name  = "KAFKA_REST_SCHEMA_REGISTRY_URL"
            value = "http://kad-kafka-schema-registry.ecs.local:${var.ecs_container_kafka_schema_registry_port}/"
          },
          {
            name  = "KAFKA_REST_LISTENERS"
            value = "http://0.0.0.0:${var.ecs_container_kafka_rest_api_port}"
          },
          {
            name  = "KAFKA_REST_HOST_NAME"
            value = "kad-ecs-kafka-rest-api"
          }
        ]
      }
  ])
}

resource "aws_ecs_task_definition" "kad-kafka-ksql" {
  family                   = "kad-kafka-ksql"
  network_mode             = "awsvpc"
  requires_compatibilities = []
  tags                     = {}
  container_definitions = jsonencode(
    [
      {
        name : "kad-kafka-ksql"
        container_name : "kad-kafka-ksql"
        cpu = 0
        image: var.image_kafka_ksql
        essential   = true
        mountPoints = []
        volumesFrom = []
        memoryReservation : 1024
        portMappings : [
          {
            containerPort = var.ecs_container_kafka_ksql_port,
            hostPort      = var.ecs_host_kafka_ksql_port
            protocol : "tcp"
          }
        ],
        environment = [
          {
            name = "KSQL_BOOTSTRAP_SERVERS"
            value = "PLAINTEXT://${var.msk_bootstrap_brokers}"
          },
          {
            name  = "KSQL_LISTENERS"
            value = "http://0.0.0.0:${var.ecs_container_kafka_ksql_port}"
          },
          {
            name  = "KSQL_KSQL_SERVICE_ID"
            value = "ksql-server_"
          },
          {
            name  = "KSQL_KSQL_SCHEMA_REGISTRY_URL"
            value = "http://kad-kafka-schema-registry.ecs.local:${var.ecs_container_kafka_schema_registry_port}"
          }
        ]
      }
  ])
}