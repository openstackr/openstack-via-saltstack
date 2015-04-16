keystone_setup:
  salt.state:
    - tgt: 'role:keystone'
    - tgt_type: grain
    - sls:
        - keystone.install
        - keystone.configure
        - keystone.start
        - keystone.keystone_user











