FROM mdjward/php-cli:latest
MAINTAINER M.D.Ward <dev@mattdw.co.uk>

RUN pecl install xdebug-2.4.0 && \
    echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini


