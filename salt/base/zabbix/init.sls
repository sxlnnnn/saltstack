zabbix_yum_release:
  cmd.run:
    - name: rpm -ivh http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm 
    - unless: rpm -qa | grep zabbix-release-2.4-1

zabbix-agent-install:
  pkg.installed:
    - name: zabbix-agent
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - source: salt://zabbix/files/zabbix_agentd.conf
    - template: jinja
    - defaults:
      Server: {{ pillar['zabbix-agent']['Zabbix_Server'] }}
    - require:
      - pkg: zabbix-agent-install
  service.running:
    - name: zabbix-agent
    - enable: True
    - watch:
      - pkg: zabbix-agent-install
      - file: zabbix-agent-install
