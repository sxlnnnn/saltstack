keepalived-install:
  pkg.installed:
    - names:
       - keepalived

keepalived-service:
  file.managed:
    - name: /etc/keepalived/keepalived.conf
    - source: salt://keepalived/files/keepalived-lvs.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
      vip1: {{ pillar['ip']['vip1'] }} 
      vip2: {{ pillar['ip']['vip2'] }} 
      rip1: {{ pillar['ip']['rip1'] }} 
      rip2: {{ pillar['ip']['rip2'] }} 
      rip3: {{ pillar['ip']['rip3'] }} 
      rip4: {{ pillar['ip']['rip4'] }} 
      ROUTEID: {{ pillar['ip']['routeid'] }}
      STATEID: {{ pillar['ip']['stateid'] }}
      PRIORITYID: {{ pillar['ip']['priorityid'] }}
      STATEID_2: {{ pillar['ip']['stateid_2'] }}
      PRIORITYID_2: {{ pillar['ip']['priorityid_2'] }}
  service.running:
    - name: keepalived
    - enable: True
    - watch:
      - file: /etc/keepalived/keepalived.conf

