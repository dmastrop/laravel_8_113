FROM php:8.1-fpm-alpine
# note need a fpm image for nginx config that we are using
#use 8.1 for permissions issue and error line 25 issue.

WORKDIR /var/www/html
# this is a standard folder for webservers to serve web server content.  /var/wwww will hold laravel application.

COPY src .
# we will need this built in to the image for deployment. The bind mount in the docker-compose.yaml will not work.

RUN docker-php-ext-install pdo pdo_mysql
# extra dependencies that we need. This tool installs pdo and pdo_mysqul extensions
# note there is no CMD or ENTRYPOINT.  so the command of base image will be executed. This base has a CMD to invoke php interpreter, so we don't need to list it here.

# not sure if we need these permissions. I don't have issues on mac. This might be only for linux?

#RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

#USER laravel