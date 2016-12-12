haproxy:
  pkg.installed

/etc/haproxy/haproxy.cfg:
  file.managed:
    - source: salt://haproxy/files/haproxy.cfg
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: haproxy

haproxy_service:
  service.running: 
    - name: haproxy
    - enable: True
    - reload: True
    - require: 
      - pkg: haproxy
    - watch:
      - file: /etc/haproxy/haproxy.cfg
