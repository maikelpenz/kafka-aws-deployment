# NEED CONFIGURATION:

# IMPORTANT: This needs to be changed for every new deployment as currently AWS doesn't allow removing a MSK configuration
msk_configuration_name = "<SET MSK CONFIGURATION NAME HERE>" # e.g: kad-msk-05122019

#MSK
msk_instance_type              = "kafka.m5.large"
msk_kafka_version              = "2.2.1"
msk_number_of_brokers          = "2"
msk_ebs_volume_size            = "10"
msk_encryption_data_in_transit = "TLS_PLAINTEXT"

/*
    Make sure the number of replicas makes sense according to the number of brokers of your kafka cluster. 
    E.g: if there are 2 brokers, you need the min of 1 in sync replica.

    Setting this number wrong will stop every write to kafka with the following error:
    Error: NOT_ENOUGH_REPLICAS
*/
msk_min_in_sync_replicas       = 1
msk_default_replication_factor = 1
