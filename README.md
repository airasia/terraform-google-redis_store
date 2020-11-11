Terraform module for a Redis MemoryStore in GCP

# Upgrade guide from v2.1.0 to v2.2.2

This upgrade recommends using Google VPC's `PRIVATE_SERVICE_ACCESS` connection mode. This upgrade will cause the redis instance to be allocated a new IP CIDR range (as per the connection mode) and, hence, requires the redis instance to be destroyed and then re-created.

### Minimiing customer impact during the upgrade process

If you have setup a DNS address for the redis instance using `var.dns_zone_name` (available since `v2.1.0`), and if your applications are already using the redis instance's DNS address instead of its IP address to connect to it, then it should ideally be okay to proceed with this recommended upgrade. Notice, however, that as this will cause the redis instance to be destroyed and then re-created, the redis instance will certainly be unavailable during the upgrade (usually 10 minutes). You can minizmie potenaital customer impact during this upgrade process by letting your application temporarily bypass the redis cache and call your databases directly for this brief period of time.

### Byapssing these changes

If, however, you would like to avoid all these preparationss & arrangements, simply set the variable `use_private_g_services = false` when upgrading - which uses Google VPC's `DIRECT_PEERING` connection mode - which is what has been used by default prior to this version.

**Reference**: To learn more about these 2 connection modes used by a Redis memorystore instance, [visit here](https://cloud.google.com/memorystore/docs/redis/networking#connection_modes).
