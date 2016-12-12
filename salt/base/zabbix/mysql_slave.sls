/etc/zabbix/zabbix_agentd.d/mysql_slave.conf:
  file.managed:
    - source: salt://zabbix/files/mysql_slave.conf
    - user: root
    - user: root
    - mode: 644

/etc/zabbix/mysql_slave.sh:
  file.managed:
    - source: salt://zabbix/files/mysql_slave.sh
    - user: root
    - user: root
    - mode: 755

