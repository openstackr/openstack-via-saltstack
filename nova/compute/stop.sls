{% for key, value in salt['pillar.get']('openstack:nova:compute:service', {}).iteritems() %}
{{ value }}:
    service:
      - dead 
{% endfor %}      



