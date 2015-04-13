==============
Horizon Formula
==============

Install and configure the OpenStack Horizon service.

.. note::
    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

States order :

     Install
     Configure
     Start

``install.sls``
----------

Install the required services for configuring horizon.

`Packages to be installated` 

    --> httpd
    --> memcached
    --> python-memcached
    --> mod_wsgi
    --> openstack-dashboard
---

``configure.sls``
-------------
    --> Configure/modify the dashboard configuration file
    --> Ensure apache user and group name exists in the server
    --> Configure user and group settings for the config files

``start.sls``
-------------------
    --> Start httpd and memcached services to run dashboard
    
``stop.sls``
-----------------
    --> Stop the httpd and memcached services -- This will not execute by default

``Pillar.example``
-----------------
             openstack:
                  horizon:
                    host: localhost
                    host_allow: '["*"]'

            roles:
                roletwo:
                name: Member
