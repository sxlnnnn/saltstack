/opt/real.sh:
  file.managed:
    - source: salt://vip/files/real.sh
    - user: root
    - group: root
    - mode: 755
    - template: jinja
    - defaults:
      {% if grains['fqdn'] == 'haproxy' %} 
      VIP: {{ pillar['ip']['vip1'] }}
      {% elif grains['fqdn'] == 'nginx' %}
      VIP: {{ pillar['ip']['vip2'] }}
      {% endif %}  
  cmd.run:
    - name: /opt/real.sh start 
    - unless: ip add |grep lo:0
    - require:
      - file: /opt/real.sh 
   
