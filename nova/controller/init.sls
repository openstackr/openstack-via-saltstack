controller_setup:
  salt.state:
    - tgt: 'role:novacontroller'
    - tgt_type: grain
    - sls:
        - controller.install
        - controller.configure
        - controller.start
