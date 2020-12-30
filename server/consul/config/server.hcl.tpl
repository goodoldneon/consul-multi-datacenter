{{ $bootstrapExpect := env "BOOTSTRAP_EXPECT" }}
{{ $datacenter := env "DATACENTER" }}
{{ $primaryDatacenter := env "PRIMARY_DATACENTER" }}
{{ $instanceNum := env "INSTANCE_NUM" }}
{{ $lanAddress := env "LAN_ADDRESS" }}
{{ $wanAddress := env "WAN_ADDRESS" }}
{{ $retryJoin := or (env "RETRY_JOIN") "" }}
{{ $retryJoinWan := or (env "RETRY_JOIN_WAN") "" }}

data_dir = "/tmp/"
log_level = "DEBUG"

datacenter = "{{ $datacenter }}"
primary_datacenter = "{{ $primaryDatacenter }}"

node_name = "server-{{ $instanceNum }}"

server = true

# Expected number of servers in the datacenter. Should be 3 in prod.
bootstrap_expect = {{ $bootstrapExpect }}

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
advertise_addr = "{{ $lanAddress }}"

# IP address outside the datacenter
advertise_addr_wan = "{{ $wanAddress }}"

# IP addresses of the local datacenter servers
retry_join = ["{{ $retryJoin }}"]

# IP addresses of the primary datacenter servers
retry_join_wan = ["{{ $retryJoinWan }}"]
