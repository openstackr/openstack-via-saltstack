{% if 'rabbitmq-is-master' in grains and grains['rabbitmq-is-master'] == False %}

rabbitmq_restart:
  cmd:
    - run
    - name: rabbitmq-server -detached 

{% endif %}

