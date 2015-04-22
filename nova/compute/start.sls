include:
  - .install


{% for key, value in salt['pillar.get']('openstack:nova:compute:service', {}).iteritems() %}

{{ value }}:
  service.running:
     - enable: True
     - reload: True
     - require: 
       - pkg: openstack-compute

{% endfor %}
