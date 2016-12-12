nginx_status.conf:
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.d/nginx_status.conf
    - source: salt://zabbix/files/nginx_status.conf
    - user: root
    - user: root
    - mode: 644
