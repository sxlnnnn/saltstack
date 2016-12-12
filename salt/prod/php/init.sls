include:
  - pkg

pkg-php:
  pkg.installed:
    - names:
      - zlib-devel
      - libxml2-devel
      - libjpeg-turbo-devel
      - freetype-devel
      - libpng-devel
      - libcurl-devel
      - gd-devel
      - libxslt-devel
      - openssl-devel
      - libmcrypt-devel
      - mhash-devel
      - mcrypt                                         

php-install:
  file.managed:
    - name: /usr/local/src/php-5.5.38.tar.gz
    - source: salt://php/files/php-5.5.38.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src/ && tar xf php-5.5.38.tar.gz && cd php-5.5.38 && ./configure --prefix=/usr/local/php5  --with-mysql=mysqlnd --with-iconv-dir=/usr/local/libiconv --with-freetype-dir --with-jpeg-dir --with-png-dir  --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-bcmath --enable-shmop  --enable-sysvsem --enable-inline-optimization --with-curl --enable-mbregex --enable-fpm --enable-mbstring --with-mcrypt --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --enable-short-tags --enable-static --with-xsl  --enable-fpm --with-fpm-user=www --with-fpm-group=www --enable-ftp --disable-debug --enable-opcache --with-openssl && make && make install 
    - require:
      - pkg: pkg-php
      - file: php-install
    - unless: test -d /usr/local/php5

php-ini:
  file.managed:
    - name: /usr/local/php5/lib/php.ini
    - source: salt://php/files/php.ini
    - user: root
    - group: root
    - mode: 644


php-fpm:
  file.managed:
    - name: /usr/local/php5/etc/php-fpm.conf
    - source: salt://php/files/php-fpm.conf
    - user: root
    - group: root
    - mode: 644

php-fpm-service:
  file.managed:
    - name: /etc/init.d/php-fpm
    - source: salt://php/files/php-fpm
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: chkconfig --add php-fpm
    - unless: chkconfig --list | grep php-fpm
    - require:
      - file: php-fpm-service
  service.running:
    - name: php-fpm
    - enable: True
    - require:
      - cmd: php-fpm-service
    - watch:
      - file: php-ini
      - file: php-fpm
         
