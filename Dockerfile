FROM centos:7

RUN chmod 0777 install
RUN ./install full

RUN ./server start