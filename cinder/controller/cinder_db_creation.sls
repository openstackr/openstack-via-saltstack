{% from "cinder/files/map.jinja" import mysql with context %}

mysql_python_pkg:
  pkg.installed:
    - name: MySQL-python

{{ salt['pillar.get']('keystone:mysql:dbname', mysql.dbname) }}_db:
  mysql_database.present:
    - name: {{ salt['pillar.get']('openstack:cinder:name', mysql.dbname) }}
    - connection_host: {{ salt['pillar.get']('openstack:mysql:dbhost', mysql.conn_host) }}
    - connection_user: {{ salt['pillar.get']('openstack:mysql:user', mysql.conn_user) }}
    - connection_pass: {{ salt['pillar.get']('openstack:mysql:password', mysql.conn_pass) }}
  mysql_user.present:
    - name: {{ salt['pillar.get']('openstack:cinder:name', mysql.username) }}
    - password: {{ salt['pillar.get']('openstack:cinder:password', mysql.password ) }}
    - connection_host: {{ salt['pillar.get']('openstack:mysql:dbhost', mysql.conn_host) }}
    - connection_user: {{ salt['pillar.get']('openstack:mysql:user', mysql.conn_user) }}
    - connection_pass: {{ salt['pillar.get']('openstack:mysql:password', mysql.conn_pass) }}
  mysql_grants.present:
    - host: {{ salt['pillar.get']('openstack:mysql:allow_host', mysql.host_perm) }}
    - grant: {{ salt['pillar.get']('openstack:mysql:privileges', mysql.privileges) }}
    - database: '{{ salt['pillar.get']('openstack:cinder:name', mysql.dbname) }}.*'
    - user: {{ salt['pillar.get']('openstack:cinder:name', mysql.username) }}
    - connection_host: {{ salt['pillar.get']('openstack:mysql:dbhost', mysql.conn_host) }}
    - connection_user: {{ salt['pillar.get']('openstack:mysql:user', mysql.conn_user) }}
    - connection_pass: {{ salt['pillar.get']('openstack:mysql:password', mysql.conn_pass) }}
  require:
      - pkg: mysql_python_pkg

