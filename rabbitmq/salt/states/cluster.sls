{% if 'cluster-id' in grains and 'rabbitmq-is-master' in grains and grains['rabbitmq-is-master'] == False %}
include:
  - rabbitmq.stop
  - rabbitmq.copy
  - rabbitmq.restart
  - rabbitmq.join
{% endif %}
