##Build off of Ubuntu 14.04 base
FROM ubuntu:14.04
##Install nginx, remove apt cache, setup logging to stdout/stderr
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/* &&\
    ln -sf /dev/stdout /var/log/nginx/access.log && \ 
    ln -sf /dev/stderr /var/log/nginx/error.log
##Lay down nginx config
COPY nginx.conf /etc/nginx/sites-available/default
##Expose both http/https in single layer 
EXPOSE 80 443
##Start nginx in foreground by default 
CMD /usr/sbin/nginx -g 'daemon off;'
