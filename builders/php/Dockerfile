FROM php:7.2-fpm

MAINTAINER "Tiago Sampaio"

ENV PHP_EXTRA_CONFIGURE_ARGS="--enable-fpm --with-fpm-user=magento2 --with-fpm-group=magento2"

# Add Scripts directory
ADD builders/scripts /var/scripts

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libicu-dev \
    libxml2-dev libxslt1-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    default-mysql-client \
    ocaml \
    expect \
    && sh /var/scripts/install-tools.sh \
    && sh /var/scripts/install-vim.sh \
    && sh /var/scripts/install-alias.sh \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure hash --with-mhash \
    && docker-php-ext-install -j$(nproc) intl xsl gd zip pdo_mysql opcache soap bcmath json iconv \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && pecl install xdebug && docker-php-ext-enable xdebug \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_host=127.0.0.1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.max_nesting_level=1000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && chmod 666 /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
#    && useradd -m -d /home/magento2 -s /bin/bash magento2 && adduser magento2 sudo \
#    && echo "magento2 ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
#    && touch /etc/sudoers.d/privacy \
#    && echo "Defaults        lecture = never" >> /etc/sudoers.d/privacy \
#    && mkdir /home/magento2/magento2 && mkdir /var/www/magento2 \
#    && mkdir /home/magento2/state \
#    && curl -sS https://accounts.magento.cloud/cli/installer -o /home/magento2/installer

# PHP config
ADD conf/php/php.ini /usr/local/etc/php/conf.d/zzz-docker.ini

# php-fpm config
#ADD conf/php/php-fpm-magento2.conf /usr/local/etc/php-fpm.d/php-fpm-magento2.conf

#ENV PATH $PATH:/home/magento2/scripts/:/home/magento2/.magento-cloud/bin
#ENV PATH $PATH:/var/www/magento2/bin

#ENV USE_SHARED_WEBROOT 1
#ENV SHARED_CODE_PATH /var/www/magento2
#ENV WEBROOT_PATH /var/www/magento2
#ENV MAGENTO_ENABLE_SYNC_MARKER 0

# Initial scripts
#COPY scripts/ /home/magento2/scripts/
#RUN sed -i 's/^/;/' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && cd /home/magento2/scripts && composer install && chmod +x /home/magento2/scripts/m2init \
#    && sed -i 's/^;;*//' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

#RUN chown -R magento2:magento2 /home/magento2 && \
#    chown -R magento2:magento2 /var/www/magento2 && \
#    chmod 755 /home/magento2/scripts/bin/magento-cloud-login

# Delete user password to connect with ssh with empty password
#RUN passwd magento2 -d

#EXPOSE 80 22 5000 44100 9000
WORKDIR /var/www/html/magento2

#USER root

#ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
