/usr/local/src/jdk-8u111-linux-x64.rpm:
  file.managed:
    - source: salt://jdk/files/jdk-8u111-linux-x64.rpm
  cmd.run:
    - name: cd /usr/local/src/ && rpm -i jdk-8u111-linux-x64.rpm
    - unless: rpm -qa |grep jdk
    - require:
      - file: /usr/local/src/jdk-8u111-linux-x64.rpm

jdk-profile:
  file.append:
    - name: /etc/profile
    - text:
      - export JAVA_HOME=/usr/java/jdk1.8.0_111
      - export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
      - export PATH=$PATH:$JAVA_HOME/bin
