MySQL
==============

Install and configure Mysql Single or Cluster Setup 


	Role Setup
================
Used for Setting Following  Custom grain items

Role  (Input value :string) :            mysql
mysql-is-master  (Input value :boolean): True
cluster-id  (Input value :string):       mysql-cluster1
openstack-id  (Input value :string):     openstack-dev

Available states
================
States order :

     Install
     Configure
     Start

``install.sls``
----------

Install the required services for configuring MySQL.

`Packages to be installated` 

    --> MariaDB-Galera-server
    --> galera
    --> rsync 

``configure.sls``
-------------
    --> Check the cluster servers using cluster-id
    --> Configure the cluster.cnf and perform validation
    --> Move the file to the respective servers 

``start.sls``
-------------------
    --> Start Mysql service with required commands according to the roles set
    
``stop.sls``
-----------------
    --> Stop the Mysql Service if it is running

``restart.sls``
-----------------
    --> Restart the Mysql Service 