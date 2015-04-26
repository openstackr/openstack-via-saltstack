{% if 'haproxy' in grains and grains['haproxy'] == 'rabbitmq' %}



rabbit_user:
    rabbitmq_user.present:
        - name: rabbitmq
        - password: password
        - force: True

{%- endif -%}
