/etc/sudoers:
  file.append:
    - text:
      - "zabbix  ALL=NOPASSWD: /sbin/ipvsadm"
    - unless: grep zabbix /etc/sudoers
      
