{% if 'rabbitmq-is-master' in grains and grains['rabbitmq-is-master'] == False %}

rabbit_join:
  rabbitmq_cluster.join:
    {%- for master,value in salt['mine.get']('G@cluster-id:' + grains['cluster-id'] + ' and G@role:rabbitmq and G@rabbitmq-is-master:true','grains.items','compound').items() %}
    - host: {{ master }} 
    {% endfor %}
{%- endif -%}
