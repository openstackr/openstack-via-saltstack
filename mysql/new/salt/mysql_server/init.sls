{% if salt['grains.get']('role') == "mysql" -%}

include:
  - mysql_server.install
  - mysql_server.configure
  - mysql_server.start
  
{% endif %}
