include:
  - mysqlserver.install

mysql_start:
  cmd: 
    - run
    {% if 'cluster-id' in grains -%}
      {%-  for servername,clusterid  in salt ['mine.get']('G@cluster-id:mysql* and G@role:mysql', 'serverid','compound').items() -%}
       {%- if servername == grains['id'] and grains['mysql-is-master'] == True %}
    - name: service mysql start --wsrep-new-cluster 
         {%- elif  servername == grains['id'] and grains['mysql-is-master'] == False %}
    - name: service mysql start
         {%- endif -%}
       {%-  endfor -%}
    {%- else %}
    - name: service mysql start 
    {%- endif %}
    - require:
      - pkg: mysql_install
