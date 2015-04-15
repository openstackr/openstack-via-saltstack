include:
  - cinder.controller.cinder_db_creation
  - cinder.controller.user_creation

cinder_packages:
  pkg.installed:
    - pkgs:
      - openstack-cinder 
      - python-cinderclient
      - python-oslo-db
    - pkg_verfy: True
