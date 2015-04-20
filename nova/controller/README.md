# Formula for openstack nova controller installation
.. note::
    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

#Available states
#state order:
* init
* install
* database
* keystone_user
* configure
* start



# init:
This state will get executed when the mentioned role in target is matched with grain data
- tgt: 'role:novacontroller'
- tgt_type: grain

# how to set role in minion ?
Reference:
http://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.grains.html

example:

setting roles via Cli:
```sh
$ salt 'yourminion'  grains.setval  role novacontroller
```
setting roles via  salt-cloud map file:

```sh
 centos_small:
    - web1:
        minion:
            log_level: debug
            grains:
                role: novacontroller
 ```            


#install
 This state will install the followinf packages
 
  python-novaclient, openstack-nova-api, openstack-nova-novncproxy, openstack-nova-scheduler, openstack-nova-console, openstack-nova-conductor, openstack-nova-cert
 
# configure
This state will execute 

* create nova database
* create nova user
* grant permission to nova user
* source nova.conf file to master to minion
* source api-paste.ini file to master to minion
* keystone db_sync

# start 
This state will start the below services

openstack-nova-api,openstack-nova-cert,openstack-nova-consoleauth,openstack-nova-scheduler,openstack-nova-conductor,openstack-nova-novncproxy

#keystone_user
This state will create the below stuffs

* create nova user and map under admin tenant admin role
* create nova service
* create nova endpoint


# pillar.example
make sure you have append the below data in your pillar file
```sh
openstack:
  mysql:
    conn_user: root
    conn_pass: root
    dbhost: 127.0.0.1
    allow_host: '"%"'
    privileges: ALL PRIVILEGES

  token:
    conn_token: admin
	
  rabbitmq:
    password: rabbitpass
    host: raja
    rpc_backend: rabbit
    rabbit_port: 5672
	
   nova:
    name: nova
    password: nova_pass
    email: nova@test.com
    host: controller ##In Case of Seperate Controller for nova##
    vnc_port: 6080
    service:
      controller:
        nova_api: openstack-nova-api
        nova_cert: openstack-nova-cert
        nova_auth: openstack-nova-consoleauth
        nova_scheduler: openstack-nova-scheduler
        nova_conductor: openstack-nova-conductor
        nova_novncproxy: openstack-nova-novncproxy
```



 
