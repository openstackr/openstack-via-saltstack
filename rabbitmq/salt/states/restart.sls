rabbitmq_restart:
  cmd:
    - script 
    - name: salt://rabbitmq/status.sh
