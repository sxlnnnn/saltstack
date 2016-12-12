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
  'nginx':
    - zabbix.nginx_status
  'mysql-master':
    - zabbix.check_mysql
  'mysql-slave':
    - zabbix.check_mysql
    - zabbix.mysql_slave 
prod:
  'lvs-master':
    - keepalived
  'lvs-slave':
    - keepalived
  'nginx':
    - nginx
    - vip
    - nginx.status
    - nginx.upstream
    - nginx.php-lb
    - nginx.www-lb
    - nginx.jj-lb
  'haproxy':
    - haproxy
    - vip
  'tomcat':
    - jdk
    - tomcat
  'php':
    - nginx
    - php
    - nginx.php
  'mysql-master':
    - mysql
  'mysql-slave':
    - mysql
