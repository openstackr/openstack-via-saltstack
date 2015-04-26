{% if 'mysql-cluster-id' in grains %}
MySQL-python:
  pkg.installed


root_change_password:
  mysql_user.present:
    - name: root
    - password: mysql
    - connection_user: root
    - connection_pass: mysql
root_newuser:
  mysql_user.present:
    - name: root
    - host: '%'
    - password: mysql 
    - connection_user: root
    - connection_pass: mysql 
  mysql_grants.present:
    - grant: ALL PRIVILEGES
    - database: '*.*'
    - user: root 
    - host: '%'
    - grant_option: True
    - connection_user: root
    - connection_pass: mysql
  require:
    - pkg: MySQL-python 
{% endif %}
