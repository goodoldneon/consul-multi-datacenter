{{ $datacenter := env "CONSUL_DATACENTER" }}
{{ $instanceNum := env "INSTANCE_NUM" }}
{{ $serviceName := env "SERVICE_NAME" }}

"service" = {
  "name" = "{{ $serviceName }}"
  "port" = 80
}

datacenter = "{{ $datacenter }}"
node_name = "{{ $serviceName }}-{{ $instanceNum }}"
