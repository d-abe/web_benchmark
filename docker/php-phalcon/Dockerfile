FROM ubuntu:latest

run apt-get update && \
    apt-get install -y -q software-properties-common && \
    apt-add-repository ppa:phalcon/stable && \
    apt-get update && \
    apt-get install -y -q php5-common php5-cli php5-fpm php5-dev php5-pgsql php5-gd php5-curl php-pear php5-imagick php5-mcrypt php5-memcached php5-phalcon libpcre3-dev curl nginx && \
    php5enmod mcrypt && \
    php5enmod phalcon && \
    sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ Asia\/Tokyo/g' /etc/php5/fpm/php.ini && \
    sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ Asia\/Tokyo/g' /etc/php5/cli/php.ini && \
    sed -i "s/expose_php=.*/expose_php=Off/" /etc/php5/fpm/php.ini && \
    sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 20M/" /etc/php5/fpm/php.ini && \
    sed -i "s/post_max_size = 2M/post_max_size = 20M/" /etc/php5/fpm/php.ini && \
    /etc/init.d/php5-fpm restart && \
    rm -Rf /etc/nginx/sites-enabled/default && \
    rm -rf /var/lib/apt/lists/*

VOLUME [/etc/php5,/etc/nginx,/var/log/nginx]

ADD ./nginx-site.conf /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default && \
    /etc/init.d/nginx restart && \
    echo "/etc/init.d/php5-fpm restart" >> /etc/bash.bashrc && \
    echo "/etc/init.d/nginx restart" >> /etc/bash.bashrc

EXPOSE 443
EXPOSE 80

