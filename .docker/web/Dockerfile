FROM nginx:1.15-alpine

MAINTAINER Marlon Buella <marlon.b.buella@gmail.com>

# Configure Nginx
COPY config/nginx-www.mage2.ph.conf /etc/nginx/conf.d/www.mage2.ph.conf
COPY config/nginx.conf.mage /etc/nginx/conf.d/nginx.conf.mage
COPY error-pages/50x.html /usr/share/nginx/error-pages/50x.html

RUN mv -f /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.off
#COPY scripts/entrypoint.sh /
#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["nginx", "-g", "daemon off;"]
