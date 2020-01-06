#
# Dockerfile for cpuminer
# usage: docker run creack/cpuminer --url xxxx --user xxxx --pass xxxx
# ex: docker run creack/cpuminer --url stratum+tcp://ltc.pool.com:80 --user creack.worker1 --pass abcdef
#
#

FROM            ubuntu:16.04
MAINTAINER      VeriBlock 

RUN             apt-get update -qq && \
                apt-get install -qqy automake libcurl4-openssl-dev git make gcc

RUN            git clone https://github.com/VeriBlock/vbk-ri-btc-cpuminer.git

RUN             cd vbk-ri-btc-cpuminer && \
                ./autogen.sh && \
                ./configure CFLAGS="-O3" && \
                make

WORKDIR         /vbk-ri-btc-cpuminer
ENTRYPOINT      ["./minerd"]
