FROM ubuntu:14.04

WORKDIR /project

RUN apt-get update && \
    apt-get install -y gcc g++ lib32z1 g++-multilib gcc-multilib libc6-dev-i386 lib32gcc1

COPY build.sh /usr/local/bin/build
RUN chmod 777 /usr/local/bin/build

CMD [ "bash" ]