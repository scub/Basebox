firewall:
  install: True
  enabled: True
  strict: True 

  whitelist:
    networks:
      comment: 'Whitelisted'
      ips_allow:
        - 10.0.0.0/8

  services:
    ssh:
      comment: "Allow SSH Access"
      block_nomatch: False
      new: True

