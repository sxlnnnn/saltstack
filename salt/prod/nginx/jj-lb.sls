/etc/nginx/conf.d/jjlb.conf:
  file.managed:
    - source: salt://nginx/files/jjlb.conf
    - user: root
    - group: root
    - mode: 644

  service.running: 
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - file: /etc/nginx/conf.d/jjlb.conf
