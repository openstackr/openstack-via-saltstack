# Formula for openstack nova compute installation
.. note::
    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

#Available states
#state order:
* init
* install
* configure
* start




# init:
This state will get executed when the mentioned role in target is matched with grain data
- tgt: 'role:novacompute'
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
                role: novacompute
 ```            


#install
 This state will install the following packages
 
  openstack-nova-compute,sysfsutils
 
# configure
This state will execute 

*  source nova.conf file to master to minion


# start 
This state will start the below services

libvirtd,openstack-nova-compute



# pillar.example
make sure you have append the below data in your pillar file
```sh
openstack:
  nova:
    compute:
      my_ip: MANAGEMENT_INTERFACE_IP_ADDRESS
      vnc_enabled: True
      vncserver_listen: 0.0.0.0
      vncserver_proxyclient_address:  MANAGEMENT_INTERFACE_IP_ADDRESS
      novncproxy_base_url: http://controller:6080/vnc_auto.html
      glance_host: controller
      virt_type: kvm
      service:
        libvirt: libvirtd
        novacompute: openstack-nova-compute


```



 