FROM alpine:latest

MAINTAINER "Tiago Sampaio <tiago@tiagosampaio.com>"

ENV MAGENTO_VERSION=2.3.2 \
    MAGENTO_EDITION="Open Souce"

RUN mkdir /magento2 \
    && apk add --no-cache curl \
    && curl -L http://pubfiles.nexcess.net/magento/ce-packages/magento2-${MAGENTO_VERSION}.tar.gz | tar xzf - -o -C /magento2

WORKDIR /magento2

CMD tail -f /dev/null
