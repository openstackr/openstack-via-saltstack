rabbitmq_start:
  cmd:
    - run
    - names: 
      - rabbitmq-server -detached 
      - salt-call cp.push /var/lib/rabbitmq/.erlang.cookie

