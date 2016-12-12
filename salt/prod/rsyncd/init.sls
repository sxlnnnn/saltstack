rsync:
  pkg.installed

/etc/rsyncd.conf:
  file.managed:
    - source: salt://rsyncd/files/rsyncd.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
      server: {{ pillar['ip']['rsyncd'] }}
/etc/init.d/rsyncd:
  file.managed:
    - source: salt://rsyncd/files/rsyncd.sh
    - user: root
    - group: root
    - mode: 755 
  cmd.run:
    - name: chkconfig --add rsyncd 
    - unless: chkconfig --list |grep rsyncd
    - require:
      - file: /etc/init.d/rsyncd
  service.running:
    - name: rsyncd
    - enable: True
    - watch:
      - file: /etc/rsyncd.conf 
