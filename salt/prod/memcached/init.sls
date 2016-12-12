memcached:
  pkg.installed

memcached-service:
  service.running:
    - name: memcached
    - enable: True
