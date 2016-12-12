zabbix_tcp_status_conf:
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.d/tcp_status.conf
    - source: salt://zabbix/files/tcp_status.conf
    - user: root
    - user: root
    - mode: 644

tcp_status_sh:
  file.managed:
    - name: /etc/zabbix/tcp_status.sh
    - source: salt://zabbix/files/tcp_status.sh
    - user: root
    - user: root
    - mode: 755

