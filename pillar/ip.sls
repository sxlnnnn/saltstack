ip:
  vip1: 192.168.1.66
  vip2: 192.168.1.249
  rip1: 192.168.1.71
  rip2: 192.168.1.72
  rip3: 192.168.1.254
  rip4: 192.168.1.253
{% if grains['fqdn'] == 'lvs-master' %}
  routeid: LVS_1
  stateid: MASTER
  priorityid: 150
  stateid_2: BACKUP
  priorityid_2: 100
{% elif grains['fqdn'] == 'lvs-slave' %}
  routeid: LVS_2
  stateid: BACKUP
  priorityid: 100
  stateid_2: MASTER
  priorityid_2: 150
{% endif %}
  rsyncd: 192.168.1.91
