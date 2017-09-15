ntp:
  ng:
    settings:
      ntpd: True
      ntp_conf:
        driftfile: ['/var/lib/ntp/ntp.drift']
        statistics: ['loopstats peerstats clockstats']
        server: ['0.us.pool.ntp.org', '1.us.pool.ntp.org']
        filegen:
          - 'loopstats file loopstats type day enable'
          - 'peerstats file peerstats type day enable'
          - 'clockstats file clockstats type day enable'
        restrict:
          - '-4 default kod notrap nomodify nopeer noquery'
          - '-6 default kod notrap nomodify nopeer noquery'
          - '127.0.0.1'
          - '::1'
