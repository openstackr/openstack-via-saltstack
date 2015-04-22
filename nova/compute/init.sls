compute_setup:
  salt.state:
    - tgt: 'role:novacompute'
    - tgt_type: grain
    - sls:
        - nova.compute.install
        - nova.compute.configure
        - nova.compute.start

