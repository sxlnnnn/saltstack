include:
  - pkg.pkg-init

haproxy-install:
  file.managed:
    - name: /usr/local/src/haproxy-1.6.9.tar.gz
    - source: salt://haproxy/files/haproxy-1.6.9.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src/ && tar xf haproxy-1.6.9.tar.gz && cd haproxy-1.6.9 && make TARGET=linux2628 && make install && cp /usr/local/sbin/haproxy /usr/sbin/
    - unless: test -f /usr/sbin/haproxy
    - require:
      - pkg: pkg-init
      - file: haproxy-install

haproxy-init:
  file.managed:
    - name: /etc/init.d/haproxy
    - source: salt://haproxy/files/haproxy.init
    - user: root
    - group: root
    - mode: 755
    - require:
      - cmd: haproxy-install
  cmd.run:
    - name: chkconfig --add haproxy 
    - unless: chkconfig --list |grep haproxy
    - require:
      - file: haproxy-init 

haproxy-config-dir:
  file.directory:
    - name: /etc/haproxy
    - user: root
    - group: root
    - mode: 755
         
  
   
