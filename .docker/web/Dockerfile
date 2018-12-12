FROM nginx:1.15-alpine

MAINTAINER Marlon Buella <marlon.b.buella@gmail.com>

COPY www /var/www
COPY .docker/web/config/nginx-www.mage2.ph.conf /etc/nginx/conf.d/www.mage2.ph.conf
COPY .docker/web/error-pages/50x.html /usr/share/nginx/error-pages/50x.html

# Configure Nginx
RUN mv -f /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.off

RUN chown -R nginx:nginx /var/www
