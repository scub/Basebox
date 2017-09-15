fail2ban:
    lookup:
        config:
            loglevel: 2
            ignoreip: 127.0.0.1/8
            bantime: 600
            maxretry: 3
            backend: auto
        jails:
            ssh:
                action:
                    - iptables[name=SSH, port=ssh, protocol=tcp]
                enabled: 'true'
                filter: sshd
                logpath: /var/log/auth.log
                maxretry: 4
                port: ssh
