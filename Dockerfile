## Reference source: https://github.com/ucsb-seclab/hal-fuzz/blob/master/Dockerfile
FROM ubuntu:16.04

RUN apt-get update 
RUN apt-get install -y sudo automake virtualenvwrapper python3-pip python-pip python3-dev python-dev build-essential libxml2-dev libxslt1-dev git libffi-dev cmake libreadline-dev libtool debootstrap debian-archive-keyring libglib2.0-dev libpixman-1-dev screen binutils-multiarch nasm vim libssl-dev

WORKDIR /root/
RUN git clone https://github.com/Battelle/afl-unicorn.git
WORKDIR /root/afl-unicorn/
RUN make
RUN make install
WORKDIR /root/afl-unicorn/unicorn_mode/
RUN sed -i -e "s/git clone \"\$UNICORN_URL\"/git clone \"\$UNICORN_URL\" -b 1.0.1/" build_unicorn_support.sh
RUN ./build_unicorn_support.sh
WORKDIR /root/afl-unicorn/
