#!/usr/bin/env sh

DIR=/var/temp
DB_DIR=$DIR/magento2.sql.tar.xz

mkdir ${DIR}
curl -L https://github.com/tiagosampaio/magento2-sampledata/raw/Open-Source-${MAGENTO_VERSION}/db/magento2.sql.tar.xz -o $DB_DIR
tar -xf $DB_DIR -C $DIR

mysql -h database -u root -proot magento2 < $DIR/magento2.sql

rm -rf $DB_DIR

sh ./magento-setup-install.sh
