{% if 'rabbitmq-cluster-id' in grains and grains['rabbitmq-is-master'] == True %}

rabbit_user:
  rabbitmq_user.present:
    - name: test
    - password: rabbitmq
    - force: True
{% endif %}
