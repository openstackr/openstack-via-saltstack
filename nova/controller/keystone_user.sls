{% from "nova/controller/files/map.jinja" import mysql, default  with context %}

keystone_user:
  keystone.user_present:
    - name: {{ salt['pillar.get']('openstack:nova:name', mysql.username) }}
    - password: {{ salt['pillar.get']('openstack:nova:password', mysql.password) }}
    - email: {{ salt['pillar.get']('openstack:nova:email', default.email) }}
    - roles:
      - admin:
        - admin 
        - Member
      - service:
        - admin
        - Member
    - connection_token:   {{ salt['pillar.get']('openstack:token:conn_token', default.admin_token) }}

keystone_service:
  keystone.service_present:
    - name: {{ salt['pillar.get']('openstack:nova:name', mysql.username) }}
    - service_type: compute
    - description: Openstack compute
    - connection_token:   {{ salt['pillar.get']('openstack:token:conn_token', default.admin_token) }}

keystone_endpoint:
  keystone.endpoint_present:
    - name: {{ salt['pillar.get']('openstack:nova:name', mysql.username) }}
    - publicurl: http://controller:8774/v2/%(tenant_id)s  
    - internalurl: http://controller:8774/v2/%(tenant_id)s 
    - adminurl: http://controller:8774/v2/%(tenant_id)s 
    - region: regionone  
    - profile: openstack1
    - connection_token:   {{ salt['pillar.get']('openstack:token:conn_token', default.admin_token) }}

