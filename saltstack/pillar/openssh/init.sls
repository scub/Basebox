
sshd_config:
  Port: 22
  Protocol: 2
  HostKey:
    - /etc/ssh/ssh_host_rsa_key
    - /etc/ssh/ssh_host_dsa_key
    - /etc/ssh/ssh_host_ecdsa_key
    - /etc/ssh/ssh_host_ed25519_key
  UsePrivilegeSeparation: 'yes'
  KeyRegenerationInterval: 3600
  ServerKeyBits: 1024
  SyslogFacility: AUTH
  LogLevel: INFO
  LoginGraceTime: 120
  PermitRootLogin: 'yes'
  PasswordAuthentication: 'yes'
  StrictModes: 'yes'
  RSAAuthentication: 'yes'
  PubkeyAuthentication: 'yes'
  IgnoreRhosts: 'yes'
  RhostsRSAAuthentication: 'no'
  HostbasedAuthentication: 'no'
  PermitEmptyPasswords: 'no'
  ChallengeResponseAuthentication: 'no'
  AuthorizedKeysFile: '%h/.ssh/authorized_keys'
  X11Forwarding: 'no'
  X11DisplayOffset: 10
  PrintMotd: 'yes'
  PrintLastLog: 'yes'
  TCPKeepAlive: 'yes'
  AcceptEnv: "LANG LC_*"
  Subsystem: "sftp /usr/lib/openssh/sftp-server"
  UsePAM: 'yes'
  UseDNS: 'no'
  matches:
    sftp_chroot:
      type:
        Group: sftpusers
      options:
        ChrootDirectory: /sftp-chroot/%u
        X11Forwarding: no
        AllowTcpForwarding: no
        ForceCommand: internal-sftp
