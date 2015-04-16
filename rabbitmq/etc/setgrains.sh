#!/bin/sh

OPENSTACK_ID="devstack"

RABBITMQ_MASTER="Testserver2"
RABBITMQ_SLAVE="Testserver1"
RABBITMQ_SINGLE=""
RABBITMQ_CLUSTER_ID="rabbitmq-cluster1"


##Setting MASTER RabbitMQ Grains##
if [ "$RABBITMQ_MASTER" != "" ]
then
salt $RABBITMQ_MASTER grains.setval openstack-id $OPENSTACK_ID
salt $RABBITMQ_MASTER grains.setval role rabbitmq 
salt $RABBITMQ_MASTER grains.setval rabbitmq-is-master true 
salt $RABBITMQ_MASTER grains.setval rabbitmq-cluster-id $RABBITMQ_CLUSTER_ID
else
echo "RabbitMQ Master is not Set"
fi


##Setting SLAVE RabbitMQ Grains##
if [ "$RABBITMQ_SLAVE" != "" ] 
then
salt $RABBITMQ_SLAVE grains.setval openstack-id $OPENSTACK_ID
salt $RABBITMQ_SLAVE grains.setval role rabbitmq
salt $RABBITMQ_SLAVE grains.setval rabbitmq-is-master false
salt $RABBITMQ_SLAVE grains.setval rabbitmq-cluster-id $RABBITMQ_CLUSTER_ID
else
echo "RabbitMQ Slave is not Set"
fi

##Setting RabbitMQ SINGLE##
if [ "$RABBITMQ_SINGLE" != "" ]
then
salt $RABBITMQ_SINGLE grains.setval openstack-id $OPENSTACK_ID
salt $RABBITMQ_SINGLE grains.setval role rabbitmq
else
echo "RabbitMQ Single Server Instance is not Set"
fi


