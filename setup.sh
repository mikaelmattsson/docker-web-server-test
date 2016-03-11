#!/usr/bin/env bash

docker build -t my-nginx -f docker/nginx/Dockerfile .
docker build -t my-php -f docker/php-fpm/Dockerfile .

docker rm -f test-php-fpm
docker rm -f test-nginx

docker run -d \
        -v "$(pwd)"/src:/var/www \
        --name test-php-fpm \
        my-php

docker run -d \
        -v "$(pwd)"/src:/var/www \
        --link test-php-fpm:phpfpm \
        --name test-nginx \
        -p 8085:80 \
        my-nginx
