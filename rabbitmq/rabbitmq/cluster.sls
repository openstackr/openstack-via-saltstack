{% if 'cluster-id' in grains %}
include:
  - rabbitmq.stop
  - rabbitmq.copy
  - rabbitmq.restart
  - rabbitmq.join
{% endif %}
