FROM nginx

RUN rm /etc/nginx/conf.d/default.conf
COPY docker/nginx/site.conf /etc/nginx/conf.d/default.conf

RUN mkdir /var/www /var/logs

WORKDIR /var/www

EXPOSE 80
