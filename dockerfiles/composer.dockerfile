FROM composer:latest
# this is the composer image on dockerhub

# I don't seem to have permissions issue on Mac. This might be for linux and windows setups?
#RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

#USER laravel

WORKDIR /var/www/html
# this is where our laravel source code will be.  See the docker-compose file.

ENTRYPOINT [ "composer", "--ignore-platform-reqs" ]
# this is why we need a dockerfile because we need a ENTRYPOINT. We can do this on docker-compose but best to do here
# this is a utility container so that we can run composer without installing on local machine.
# the ignore: we can run even if some dependencies are missing.
# for the artisan and the npm since there is no dockerfile for those we can do the ENTRYPOINT in docker-compose.yaml.