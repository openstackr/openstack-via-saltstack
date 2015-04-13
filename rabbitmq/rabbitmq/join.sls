{% if 'rabbitmq-is-master' in grains and grains['rabbitmq-is-master'] == False %}

rabbit_join:
  rabbitmq_cluster.join:
    {% for mastername,local in salt['mine.get']('rabbitmq-is-master:True', 'serverid','grain').items() %}
    - host: {{ mastername }} 
    {% endfor %}
{%- endif -%}
