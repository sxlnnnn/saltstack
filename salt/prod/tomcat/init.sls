/usr/local/apache-tomcat-8.5.9.tar.gz:
  file.managed:
    - source: salt://tomcat/files/apache-tomcat-8.5.9.tar.gz
  cmd.run:
    - name: cd /usr/local/ && tar xf apache-tomcat-8.5.9.tar.gz && ln -s /usr/local/apache-tomcat-8.5.9 /usr/local/tomcat && /usr/local/tomcat/bin/startup.sh && echo /usr/local/tomcat/bin/startup.sh >>/etc/rc.local
    - unless: test -d /usr/local/tomcat
    - require:
      - file: /usr/local/apache-tomcat-8.5.9.tar.gz
