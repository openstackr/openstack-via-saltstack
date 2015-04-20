include:
  - mysql_server.repo

mysql_install:
  pkg.installed:
    - pkgs:
      - MariaDB-Galera-server
      - galera
      - rsync
    - require:
      - sls : mysql_server.repo
