{% if 'rabbitmq-is-master' in grains and grains['rabbitmq-is-master'] == False %}

rabbitmq_stop:
  cmd:
    - run
    - names: 
      - rabbitmqctl stop
      - sleep 5

{% endif %}

