rsyslog:
  protocol: udp                           # protocol to use to send to target
  listentcp: true                         # omit to disable listening on tcp port
  listentcpprt: 514                       # specify tcp listen port ($InputTCPServerRun)
  listenudp: true                         # omit to disable listening on udp port
  imkllog: true                           # omit to log kernel messages
  imjournal: false                        # omit to log journal messages
  immark: false                           # enable/disable mark messages support
  markmessageperiod: 1200                 # Specifies when mark messages are written (seconds)
  logbasepath: /var/logs                  # base path for logs to be saved to
                                          # also enables logging per host, per day
  fileowner: root                         # set the owner of the logfiles
  filegroup: root                         # set the group of the logfiles
  filemode: '0640'                        # mode for created log files
  dirmode: '0755'                         # mode for dirs created in log file paths
  template: 'RSYSLOG_FileFormat'          # file default template
