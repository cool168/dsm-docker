FROM ubuntu:16.04

MAINTAINER Cuteribs <ericfine1981@live.com>

# Switches deb source to China mirror
#RUN sed -i.bak 's/archive/cn\.archive/' /etc/apt/sources.list

# Deploys files
ADD ./packages/xware.tar.gz /app/
ADD ./packages/kcp.tar.gz /app/
ADD ./packages/3proxy.tar.gz /app/
COPY ./packages/*.deb /app/
COPY ./*.sh /app/
RUN chmod +x /app/*.sh

RUN	dpkg -i /app/libmbedcrypto0_*.deb
RUN	dpkg -i /app/shadowsocks-libev_*.deb
RUN	rm /etc/init.d/shadowsocks-libev

RUN	dpkg -i /app/libpopt0_*.deb
RUN	dpkg -i /app/cron_*.deb
RUN	dpkg -i /app/logrotate_*.deb
RUN	dpkg -i /app/privoxy_*.deb
RUN rm /etc/init.d/privoxy

RUN	dpkg -i /app/libc6_*.deb
RUN	dpkg -i /app/libc6-i386_*.deb
RUN	dpkg -i /app/lib32z1_*.deb

RUN rm RUN rm /app/*.deb

WORKDIR /app
