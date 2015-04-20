{% from "nova/controller/files/map.jinja" import mysql with context %}

{{ salt['pillar.get']('nova:mysql:dbname', mysql.dbname) }}_db:
  mysql_database.present:
    - name: {{ mysql.dbname }}
    - connection_host: {{ mysql.dbhost }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_pass }}
  mysql_user.present:
    - name: {{ salt['pillar.get']('openstack:nova:name', mysql.username) }}
    - host: {{ mysql.allow_host }}
    - password: {{ salt['pillar.get']('openstack:nova:password', mysql.password ) }}
    - connection_host: {{ mysql.dbhost }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_pass }}
  mysql_grants.present:
    - host: {{ mysql.allow_host }}
    - grant: {{ mysql.privileges }} 
    - database: '{{ mysql.dbname }}.*'
    - user: {{ salt['pillar.get']('openstack:nova:name', mysql.username) }}
    - connection_host: {{ mysql.dbhost }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_pass }}
