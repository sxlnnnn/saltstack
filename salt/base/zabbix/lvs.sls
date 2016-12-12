lvs_conf:
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.d/lvs.conf
    - source: salt://zabbix/files/lvs.conf
    - user: root
    - user: root
    - mode: 644
    - template: jinja
    - defaults:
      vip1: {{ pillar['ip']['vip1'] }} 
      vip2: {{ pillar['ip']['vip2'] }} 
      rip1: {{ pillar['ip']['rip1'] }} 
      rip2: {{ pillar['ip']['rip2'] }} 
      rip3: {{ pillar['ip']['rip3'] }} 
      rip4: {{ pillar['ip']['rip4'] }}  
