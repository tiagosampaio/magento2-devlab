FROM nginx:1.17

MAINTAINER "Tiago Sampaio"

# Add Scripts directory
ADD builders/scripts /var/scripts

RUN apt-get update \
    && sh /var/scripts/install-vim.sh \
    && sh /var/scripts/install-alias.sh

ADD conf/nginx/nginx.conf /etc/nginx
