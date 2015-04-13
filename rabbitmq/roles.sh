#!/bin/sh

##Setting Minion values to Variables##
RABBITMQ_MASTER="Testserver1"
RABBITMQ_SLAVE="Testserver2"
RABBITMQ_SINGLE="Testserver3"

##Setting RabbitMQ MASTER SERVER ##
if [ "$RABBITMQ_MASTER" != "" ]
then
salt $RABBITMQ_MASTER grains.setval openstack-id openstack-dev
salt $RABBITMQ_MASTER grains.setval role rabbitmq 
salt $RABBITMQ_MASTER grains.setval rabbitmq-is-master true
salt $RABBITMQ_MASTER grains.setval cluster-id rabbitmq-cluster1
else
echo "RabbitMQ Master is not Set"
fi

##Setting RabbitMQ SLAVE  SERVER ##
if [ "$RABBITMQ_SLAVE"  != "" ]
then
salt $RABBITMQ_SINGLE grains.setval openstack-id openstack-dev
salt $RABBITMQ_SINGLE grains.setval role rabbitmq
salt $RABBITMQ_SINGLE grains.setval rabbitmq-is-master false 
salt $RABBITMQ_SINGLE grains.setval cluster-id rabbitmq-cluster1
else
echo "RabbitMQ Slave is not Set"
fi

##Setting Single SQL Grains##
if [ "$RABBITMQ_SINGLE" != "" ]
then
salt $RABBITMQ_SINGLE grains.setval openstack-id openstack-dev
salt $RABBITMQ_SINGLE grains.setval role mysql
else
echo "RabbitMQ Server is not Set"
fi


