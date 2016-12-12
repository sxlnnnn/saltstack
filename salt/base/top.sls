base:
  '*':
    - env_init 
    - zabbix
    - zabbix.tcp_status 
  'lvs-master':
    - zabbix.lvs
    - zabbix.sudo
  'lvs-slave':
    - zabbix.lvs
    - zabbix.sudo
  'nginx1':
    - zabbix.nginx_status
  'nginx2':
    - zabbix.nginx_status
  'mysql-master':
    - zabbix.check_mysql
    - zabbix.mysql_slave 
  'mysql-slave':
    - zabbix.check_mysql
    - zabbix.mysql_slave 
prod:
  'lvs-master':
    - keepalived
  'lvs-slave':
    - keepalived
  'nginx1':
    - nginx
    - vip
    - nginx.status
    - nginx.upstream
    - nginx.php-lb
    - nginx.www-lb
    - nginx.jj-lb
  'nginx2':
    - nginx
    - vip
    - nginx.status
    - nginx.upstream
    - nginx.php-lb
    - nginx.www-lb
    - nginx.jj-lb
  'haproxy1':
    - haproxy
    - vip
  'haproxy2':
    - haproxy
    - vip
  'tomcat':
    - jdk
    - tomcat
  'php':
    - nginx
    - php
    - nginx.php
  'nfs':
    - nfs
  'rsync':
    - rsync 
  'mysql-master':
    - mysql
  'mysql-slave':
    - mysql
