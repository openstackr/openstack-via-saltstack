{% if 'role' in grains and salt['grains.get']('role') == 'rabbitmq' and 'rabbitmq-is-master' in grains and  salt['grains.get']('rabbitmq-is-master') == True %}


rabbit_user:
    rabbitmq_user.present:
        - name: rabbitmq
        - password: rabbitmq
        - force: True
        - perms:
          - '/':
            - '.*'
            - '.*'
            - '.*'

{%- endif -%}
