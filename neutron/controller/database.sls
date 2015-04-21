{% from "openstack/neutron/controller/files/map.jinja" import mysql,neutron with context %}

neutron_db:
  mysql_database.present:
    - name: {{ mysql.dbname }}
    - connection_host: {{ mysql.dbhost }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_pass }}
  mysql_user.present:
    - name: {{ neutron.username }}
    - password: {{ neutron.password }}
    - host: {{ mysql.allow_host }} 
    - connection_host: {{ mysql.dbhost }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_pass }} 
  mysql_grants.present:
    - host: {{ mysql.allow_host }} 
    - grant: {{ mysql.privileges }} 
    - database: '*.*' 
    - user: {{ neutron.username }} 
    - connection_host: {{ mysql.dbhost }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_pass }}
