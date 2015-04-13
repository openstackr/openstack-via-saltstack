## Installing the required packages to configure horizon ##

horizonpkg:
  pkg.installed:
    - pkgs:
      - httpd
      - memcached 
      - python-memcached
      - mod_wsgi
      - openstack-dashboard
    - update: True
    - pkg_verify: True
