FROM mongo:3.4.7

MAINTAINER Manjiii <manjix3@gmail.com>

# time zone
RUN /bin/cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY init/initialData.sh /tmp/

# data dir
RUN chmod 774 -R /data/db/

# log dir
RUN mkdir -p /var/log/mongodb
#RUN chmod 777 -R /var/log/mongodb

EXPOSE 27017