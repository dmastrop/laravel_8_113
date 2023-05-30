FROM nginx:stable-alpine
# same as the docker-compose.yaml file. This nginx.dockerfile will be used for deployment of Section 9
 
WORKDIR /etc/nginx/conf.d
# use this folder as the working directory of the built image so that we can....
 
COPY nginx/nginx.conf .
# copy our nginx.conf file into the /etc/nginx/conf.d directory on the container so that we are not reliant on the bind mount during deployment
 
RUN mv nginx.conf default.conf
# need to rename our nginx.conf to default.conf which is what nginx expects it to be named as

WORKDIR /var/www/html
# note the change of the working directory
 
COPY src .
#src code is copied into the /var/www/html directory of the container.
# this is so that we do not have to rely on the bind mount to get the src code into the container (deployment)

# this dockerfile results in incorporation of the both the default.conf file and the src code into the build so that 
#deployment is easier.  Bind mount is good for development. Snapshots need to be made like this for deployment.
# default nginx CMD is to start the webserver. We don't need a CMD