/etc/nginx/conf.d/wwwlb.conf:
  file.managed:
    - source: salt://nginx/files/wwwlb.conf
    - user: root
    - group: root
    - mode: 644

  service.running: 
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - file: /etc/nginx/conf.d/wwwlb.conf
