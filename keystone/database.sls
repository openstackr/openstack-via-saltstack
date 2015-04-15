{% from "keystone/files/map.jinja" import mysql with context %}

{{ salt['pillar.get']('keystone:mysql:dbname', mysql.dbname) }}_db:
  mysql_database.present:
    - name: {{ salt['pillar.get']('openstack:keystone:name', mysql.dbname) }}
    - connection_host: {{ salt['pillar.get']('openstack:mysql:dbhost', mysql.conn_host) }}
    - connection_user: {{ salt['pillar.get']('openstack:mysql:user', mysql.conn_user) }}
    - connection_pass: {{ salt['pillar.get']('openstack:mysql:password', mysql.conn_pass) }}
  mysql_user.present:
    - name: {{ salt['pillar.get']('openstack:keystone:name', mysql.username) }}
    #- host: {{ salt['pillar.get']('openstack:mysql:allow_host', mysql.dbhost) }}
    - password: {{ salt['pillar.get']('openstack:keystone:password', mysql.password ) }}
    - connection_host: {{ salt['pillar.get']('openstack:mysql:dbhost', mysql.conn_host) }}
    - connection_user: {{ salt['pillar.get']('openstack:mysql:user', mysql.conn_user) }}
    - connection_pass: {{ salt['pillar.get']('openstack:mysql:password', mysql.conn_pass) }}
  mysql_grants.present:
    - host: {{ salt['pillar.get']('openstack:mysql:allow_host', mysql.dbhost) }}
    - grant: {{ salt['pillar.get']('openstack:mysql:privileges', mysql.privileges) }}
    - database: '{{ salt['pillar.get']('openstack:keystone:name', mysql.dbname) }}.*'
    - user: {{ salt['pillar.get']('openstack:keystone:name', mysql.username) }}
    - connection_host: {{ salt['pillar.get']('openstack:mysql:dbhost', mysql.conn_host) }}
    - connection_user: {{ salt['pillar.get']('openstack:mysql:user', mysql.conn_user) }}
    - connection_pass: {{ salt['pillar.get']('openstack:mysql:password', mysql.conn_pass) }}

