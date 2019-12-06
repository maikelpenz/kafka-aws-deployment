output "msk-bootstrap-brokers" {
  description = "Plaintext connection host:port pairs"
  value       = "${aws_msk_cluster.kad-msk.bootstrap_brokers}"
}