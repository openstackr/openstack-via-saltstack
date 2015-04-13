#!/bin/sh

##Setting my Minion Values to Variables##
MYSQL_MASTER="Testserver1"
MYSQL_SLAVE="Testserver2"
MYSQL_SINGLE="Testserver3"

##Setting MASTER SQL Grains##
if [ "$MYSQL_MASTER" != "" ]
then
salt $MYSQL_MASTER grains.setval openstack-id openstack-dev
salt $MYSQL_MASTER grains.setval role mysql 
salt $MYSQL_MASTER grains.setval mysql-is-master true 
salt $MYSQL_MASTER grains.setval cluster-id mysql-cluster1
else
echo "MySQL Master is not Set"
fi


##Setting SLAVE SQL Grains##
if [ "$MYSQL_SLAVE" != "" ] 
then
salt $MYSQL_SLAVE grains.setval openstack-id openstack-dev
salt $MYSQL_SLAVE grains.setval role mysql
salt $MYSQL_SLAVE grains.setval mysql-is-master false
salt $MYSQL_SLAVE grains.setval cluster-id mysql-cluster1
else
echo "MySQL Slave is not Set"
fi


##Setting Single SQL Grains##
if [ "$MYSQL_SINGLE" != "" ]
then
salt $MYSQL_SINGLE grains.setval openstack-id openstack-dev
salt $MYSQL_SINGLE grains.setval role mysql
else
echo "MySQL Server is not Set"
fi

