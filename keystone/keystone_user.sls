{% from "keystone/files/map.jinja" import mysql, default  with context %}

keystone_tenants:
  keystone.tenant_present:
    - names:
      - admin
      - service
    - connection_token:  {{ salt['pillar.get']('openstack:token:conn_token', default.admin_token) }}

keystone_roles:
  keystone.role_present:
    - names:
      - admin
      - Member
    - connection_token:  {{ salt['pillar.get']('openstack:token:conn_token', default.admin_token) }}   

keystone_user:
  keystone.user_present:
    - name: admin
    - password: admin
    - email: admin@test.com
    - roles:
      - admin:
        - admin 
        - Member
      - service:
        - admin
        - Member
    - require:
      - keystone: keystone_tenants
      - keystone: keystone_roles
    - connection_token:  {{ salt['pillar.get']('openstack:token:conn_token', default.admin_token) }}

keystone_service:
  keystone.service_present:
    - name: keystone
    - service_type: identity
    - description: Openstack identity
    - connection_token:  {{ salt['pillar.get']('openstack:token:conn_token', default.admin_token) }}

keystone_endpoint:
  keystone.endpoint_present:
    - name: keystone
    - publicurl: http://controller:5000/v2.0  
    - internalurl: http://controller:5000/v2.0
    - adminurl: http://controller:35357/v2.0
    - region: regionone  
    - connection_token:  {{ salt['pillar.get']('openstack:token:conn_token', default.admin_token) }}
