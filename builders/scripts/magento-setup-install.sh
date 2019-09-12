#!/usr/bin/env sh

php /var/www/html/magento2/bin/magento setup:install \
	--base-url=http://${MAGENTO_DOMAIN} \
	--db-host=database \
	--db-name=magento2 \
	--db-user=root \
	--db-password=root \
	--backend-frontname=${MAGENTO_ADMIN_FRONTNAME} \
	--admin-firstname=${MAGENTO_ADMIN_FIRSTNAME} \
	--admin-lastname=${MAGENTO_ADMIN_LASTNAME} \
	--admin-email=${MAGENTO_ADMIN_EMAIL} \
	--admin-user=${MAGENTO_ADMIN_USER} \
	--admin-password=${MAGENTO_ADMIN_PASSWORD} \
	--language=${MAGENTO_LANGUAGE} \
	--currency=${MAGENTO_CURRENCY} \
	--timezone=${MAGENTO_TIMEZONE} \
	--use-rewrites=${MAGENTO_USE_REWRITES}
