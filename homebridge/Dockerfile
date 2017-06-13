FROM debian:jessie

MAINTAINER Kimos86

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Install dependencies
RUN apt-get update && apt-get upgrade -y --force-yes && apt-get install -y --force-yes --no-install-recommends
RUN apt-get install -y --force-yes xz-utils wget python libavahi-compat-libdnssd-dev

#Timezone Berlin
RUN echo Europe/Berlin > /etc/timezone && dpkg-reconfigure tzdata



