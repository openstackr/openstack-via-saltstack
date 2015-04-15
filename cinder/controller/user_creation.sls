{% from "cinder/files/map.jinja" import endpoint  with context %}

cinder_user:
  keystone.user_present:
    - name: cinder
    - password: cinder
    - email: cinder@nobody.com
    - roles:
      - admin:
        - admin
        - Member
      - service:
        - admin
        - Member
    - connection_token: admin

cinder_service:
  keystone.service_present:
    - name: cinder
    - service_type: volume
    - description: OpenStack Block Storage
    - connection_token: admin

cinder_endpoint:
  keystone.endpoint_present:
    - name: cinder
    - internalurl: http://{{ salt['pillar.get']('openstack:controller:host', endpoint.controller) }}:8776/v1/%(tenant_id)s
    - publicurl: http://{{ salt['pillar.get']('openstack:controller:host', endpoint.controller) }}:8776/v1/%(tenant_id)s
    - adminurl: http://{{ salt['pillar.get']('openstack:controller:host', endpoint.controller) }}:8776/v1/%(tenant_id)s
    - region: regionone
    - connection_token: admin

