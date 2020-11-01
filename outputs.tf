output "usage_IAM_roles" {
  description = "Basic IAM role(s) that are generally necessary for using the resources in this module. See https://cloud.google.com/iam/docs/understanding-roles."
  value = [
    "roles/redis.viewer",
  ]
}

output "host" {
  description = "Hostname (or IP address) of the Redis endpoint"
  value       = google_redis_instance.redis_store.host
}

output "port" {
  description = "Port number of the Redis endpoint."
  value       = google_redis_instance.redis_store.port
}
