openstack:
  mysql:
    dbhost: '172.25.204.97'
    allow_host: "'%'"
    privileges: ALL PRIVILEGES

  neutron:
    name: neutron
    password: neutron_password

  rabbitmq:
    rpc_backend: rabbit
    rabbit_host: rabbithost
    rabbit_password: rabbitpassword
 
  controller: controller_host 
