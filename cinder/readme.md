==============
Cinder Formula
==============

Install and configure the OpenStack Cinder controller and storage service.

.. note::
    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

    controller:
          controller.cinder_db_creation
          controller.user_creation
          controller.install
          controller.config
          controller.db_sync
          controller.start
    storage:
          storage.install
          storage.config
          storage.start
    
``controller``
----------
    controller.cinder_db_creation 
             Create the db for Cinder service.
    controller.user_creation 
             Init the Cinder user, service and endpoint.
    controller.install 
             Install the required packages for configuring cinder.
    controller.config 
             Configure cinder controller service.
    controller.db_sync 
             Sync the database up to the most recent version. This is the standard way to create the db as well.
    controller.start 
             Create users, services and endpoints in keystone server.

``storage``
----------
    storage.install 
             Install the required packages for configuring cinder.
    storage.config 
             Configure cinder storage service.
    storage.start 
             Start the services - openstack-cinder-volume,target
