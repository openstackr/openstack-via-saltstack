{% for key, value in salt['pillar.get']('openstack:nova:service:controller', {}).iteritems() %}

{{ value }}:
    service:
      - dead 
{% endfor %}      



