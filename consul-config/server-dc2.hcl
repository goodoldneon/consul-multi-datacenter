data_dir = "/tmp/"
log_level = "DEBUG"

datacenter = "dc2"
primary_datacenter = "dc1"

server = true

# Expected number of servers in the datacenter. Should be 3 in prod.
bootstrap_expect = 1

ui = true

bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"

ports {
  grpc = 8502
}

# Consul Connect
connect {
  enabled = true
}

# IP address within the datacenter
advertise_addr = "10.6.1.1"

# IP address outside the datacenter
advertise_addr_wan = "10.4.2.1"

# IP address of the primary datacenter
retry_join_wan = ["10.4.1.1"]
