{% if 'cluster-id' in grains %}

{% from "mysqlserver/files/map.jinja" import mysql with context %}

mysql_configure:
  file:
    - managed
    - name: {{ mysql.conf }}
    {%- for servername,clusterid  in salt ['mine.get']('G@cluster-id:mysql* and G@role:mysql','serverid','compound').items() -%}
      {%- if servername ==  grains['id'] and  clusterid == grains['cluster-id'] %}
    - source: salt://mysqlserver/files/cluster.cnf
      {%- endif -%}
    {%- endfor %}
    - makedirs: True
    - replace: True
    - template: jinja
{% endif %}
