{% if 'mysql-cluster-id' in grains %}
MySQL-python:
  pkg.installed


test_newuser:
  mysql_user.present:
    - name: newtestusertestravi
    - host: '%'
    - password: mysql
    - connection_host: '172.25.204.17'
    - connection_user: root
    - connection_pass: mysql
  mysql_grants.present:
    - grant: ALL PRIVILEGES
    - database: '*.*'
    - user: newtestusertestravi
    - host: '%'
    - grant_option: True
    - connection_host: '172.25.204.17'
    - connection_user: root
    - connection_pass: mysql
  require:
    - pkg: MySQL-python
{% endif %}
