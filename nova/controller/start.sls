include:
  - .install


{% for key, value in salt['pillar.get']('openstack:nova:service:controller', {}).iteritems() %}

{{ value }}:
  service.running:
     - enable: True
     - reload: True
     - require:
       - pkg: openstack-controller

{% endfor %}
