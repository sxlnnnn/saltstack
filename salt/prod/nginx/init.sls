nginx:
  pkg.installed

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/files/nginx.conf
    - user: root
    - group: root
    - mode: 644

nginx_service:
  service.running: 
    - name: nginx
    - enable: True
    - reload: True
    - require: 
      - pkg: nginx
    - watch:
      - file: /etc/nginx/nginx.conf
