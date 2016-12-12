/etc/zabbix/zabbix_agentd.d/chk_mysql.conf:
  file.managed:
    - source: salt://zabbix/files/chk_mysql.conf
    - user: root
    - user: root
    - mode: 644

/etc/zabbix/chk_mysql.sh:
  file.managed:
    - source: salt://zabbix/files/chk_mysql.sh
    - user: root
    - user: root
    - mode: 755

