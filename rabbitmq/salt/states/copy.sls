{% if 'rabbitmq-is-master' in grains and grains['rabbitmq-is-master'] == False %}

rabbitmq_confgure:
  file.managed:
    - name: /var/lib/rabbitmq/.erlang.cookie 
    - template: jinja
    {%- for master,value in salt['mine.get']('G@cluster-id:' + grains['cluster-id'] + ' and G@role:rabbitmq and G@rabbitmq-is-master:true','grains.items','compound').items() %}
    - source: salt://{{ master }}/var/lib/rabbitmq/.erlang.cookie
    {% endfor %}
    - makedirs: True
{%- endif -%}
