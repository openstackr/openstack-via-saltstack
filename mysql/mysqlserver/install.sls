mysql_install:
  pkg.installed:
    - pkgs:
      - MariaDB-Galera-server
      - galera
      - rsync
