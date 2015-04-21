neutron_conf:
  file:
    - managed
    - name: /etc/neutron/neutron.conf 
    - source: salt://openstack/neutron/controller/files/neutron.conf
    - template: jinja

ml2_conf:
  file:
    - managed
    - name: /etc/neutron/plugins/ml2/ml2_conf.ini 
    - source: salt://openstack/neutron/controller/files/ml2_conf.ini
    - template: jinja

