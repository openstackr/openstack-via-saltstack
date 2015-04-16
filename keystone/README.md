# Formula for openstack keystone installation
.. note::
    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

#Available states
#state order:
* init
* install
* database
* configure
* start
* keystone_user


# init:
This state will get executed when the mentioned role in target is matched with grain data
- tgt: 'role:keystone'
- tgt_type: grain

# how to set role in minion ?
Reference:
http://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.grains.html

example:

setting roles via Cli:
```sh
$ salt 'yourminion'  grains.setval  role keystone
```
setting roles via  salt-cloud map file:

```sh
 centos_small:
    - web1:
        minion:
            log_level: debug
            grains:
                role: keystone
 ```            


#install
 This state will install the openstack-keystone package 
 
# configure
This state will execute 

* create keystone database
* create keystone user
* grant permission to keystone user
* source keystone.conf file to master to minion
* create pki certs
* apply file ownership and file permission 
* keystone db_sync

# start 
This state will start the keystone service

#keystone_user
This state will create the below stuffs
* create tenant admin
* create role admin,member
* create keystone user and map under admin tenant admin role
* create keystone service
* create keystone endpoint


# pillar.example
make sure you have append the below data in your pillar file
```sh
openstack:
  mysql:
    user: root
    password: root
    dbhost: db.yourdomain.com
    allow_host: '"%"'
    privileges: ALL PRIVILEGES

  token:
    conn_token: admin

  keystone:
    name: keystone
    password: keystone_pass
    host: controller ##In Case of Seperate Controller for keystone##
```



 