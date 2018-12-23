#!/usr/bin/env sh

cd /var/www/mage2.ph && chmod -R 777 var generated
chown -R nginx:nginx /var/www/mage2.ph
