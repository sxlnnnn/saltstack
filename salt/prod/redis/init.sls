redis:
  pkg.installed

/etc/redis.conf:
  file.managed:
    - source: salt://redis/files/redis.conf
    - user: root
    - group: root
    - mode: 644
  service.running:
    - name: redis
    - enable: True
    - watch:
      - file: /etc/redis.conf 
