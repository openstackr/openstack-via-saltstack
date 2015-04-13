{% if 'rabbitmq-is-master' in grains and grains['rabbitmq-is-master'] == False %}

rabbitmq_confgure:
  file.managed:
    - name: /var/lib/rabbitmq/.erlang.cookie 
    - template: jinja
    {% for mastername,clusterid in salt['mine.get']('rabbitmq-is-master:True','serverid','grain').items() %}
    - source: salt://{{ mastername }}/var/lib/rabbitmq/.erlang.cookie
    {% endfor %}
    - makedirs: True
{%- endif -%}
