rabbitmq:
  salt.state:
    - tgt: 'role:rabbitmq'
    - tgt_type: grain
    - sls:
        - rabbitmq.install
        - rabbitmq.start
        - rabbitmq.configure
    {% if 'rabbitmq-cluster-id' in grains %}
    - require:
      - tgt: 'G@rabbitmq-is-master:True and G@role:rabbitmq'
      - tgt_type: compound
      - sls:
        - rabbitmq.install
        - rabbitmq.start 
    {% endif %}
