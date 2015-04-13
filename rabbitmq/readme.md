Rabbit MQ
==============

Install and configure Rabbit MQ Single or Cluster Setup 


	Role Setup
================
Used for Setting Following  Custom grain items

Role  (Input value :string) :            rabbitmq
rabbitmq-is-master  (Input value :boolean): True
cluster-id  (Input value :string):       rabbitmq-cluster1
openstack-id  (Input value :string):     openstack-dev

Available states
================
States order :

     Install
     Start
     Cluster

``install.sls``
----------

Install the required services for configuring MySQL.

`Packages to be installated` 

    --> rabbitmq-server

``start.sls``
-------------
    --> rabbitmq instance will be started
    --> .erlang cookie file will be moved to salt-master cache


``Cluster.sls``
-------------------
    --> Minions set with grain item cluster-id will be selected
    --> .erlang cookie of master server will be moved to slave  
    --> All Slave servers will be started again
    --> Once started they will be joined to master server
    