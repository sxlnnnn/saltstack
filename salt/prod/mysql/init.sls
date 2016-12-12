/usr/local/src/mysql-5.5.51-linux2.6-x86_64.tar.gz:
  file.managed:
    - source: salt://mysql/files/mysql-5.5.51-linux2.6-x86_64.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /usr/local/src/ && tar xf mysql-5.5.51-linux2.6-x86_64.tar.gz && mv mysql-5.5.51-linux2.6-x86_64 /usr/local/mysql-5.5.51 && ln -s /usr/local/mysql-5.5.51 /usr/local/mysql && useradd mysql -s /sbin/nologin -M && /usr/local/mysql/scripts/mysql_install_db --user=mysql --basedir=/usr/local/mysql/ --datadir=/usr/local/mysql/data/ 
    - unless: test -d /usr/local/mysql/data/
    - require:
      - file: /usr/local/src/mysql-5.5.51-linux2.6-x86_64.tar.gz

/etc/my.cnf:
  file.managed:
    - source: salt://mysql/files/my.cnf
    - user: root
    - group: root
    - mode: 644   

/etc/init.d/mysqld:
  file.managed:
    - source: salt://mysql/files/mysqld
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: chkconfig --add mysqld
    - unless: chkconfig --list |grep mysqld
    - require:
      - file: /etc/init.d/mysqld
  service.running:
    - name: mysqld
    - enable: True
    - require:
      - cmd: /etc/init.d/mysqld

/etc/profile:
  file.append:
    - text:
      - 'PATH=/usr/local/mysql/bin:$PATH' 
