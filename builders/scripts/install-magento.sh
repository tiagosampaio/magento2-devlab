#!/usr/bin/env sh

DIR=/var/temp
DB_DIR=$DIR/magento2.sql.tar.xz

mkdir ${DIR}
curl -L https://github.com/tiagosampaio/magento2-sampledata/raw/Open-Source-2.3.2/db/magento2.sql.tar.xz -o $DB_DIR
tar -xf $DB_DIR -C $DIR
# rm -rf $DB_DIR

mysql -h database -u root -proot magento2 < $DIR/magento2.sql

php /var/www/html/magento2/bin/magento setup:install \
	--base-url=http://dev.magento2.com \
	--db-host=database \
	--db-name=magento2 \
	--db-user=root \
	--db-password=root \
	--backend-frontname=admin \
	--admin-firstname=admin \
	--admin-lastname=admin \
	--admin-email=admin@admin.com \
	--admin-user=admin \
	--admin-password=admin123 \
	--language=en_US \
	--currency=USD \
	--timezone=America/Sao_Paulo \
	--use-rewrites=1
