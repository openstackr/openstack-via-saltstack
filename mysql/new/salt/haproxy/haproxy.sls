haproxy:
  pkg.installed  




haproxy_conf:
  file:
    - managed
    - name: /etc/haproxy/haproxy.cfg 
    - source: salt://haproxy/haproxy.cfg
    - template: jinja
    - require:
      - pkg: haproxy


haproxy_start:
  service:
    - running
    - name: haproxy

