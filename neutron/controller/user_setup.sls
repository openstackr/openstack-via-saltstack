{% from "openstack/neutron/controller/files/map.jinja" import neutron with context %}

Keystone_tenants:
  keystone.tenant_present:
    - names:
      - admin
      - demo
      - service  
    - connection_token: admin 


Keystone_roles:
  keystone.role_present:
    - names:
      - admin
      - Member
    - connection_token: admin 


Keystone_users:
  keystone.user_present:
    - name: {{ neutron.username }}
    - password: {{ neutron.password }}
    - email: neutron@openstack.com 
    - roles:
        - service:
          - admin
    - connection_token: admin 


neutron_service:
  keystone.service_present:
    - name: neutron 
    - service_type: network 
    - description: OpenStack Networking
    - connection_token: admin 


neutron_endpoint:
  keystone.endpoint_present:
    - name: neutron 
    - internalurl: http://{{ salt['pillar.get']('openstack:controller','controller')}}:9696
    - publicurl: http://{{ salt['pillar.get']('openstack:controller','controller') }}:9696
    - adminurl: http://{{ salt['pillar.get']('openstack:controller','controller')}}:9696 
    - region: regionone
    - connection_token: admin 


