FROM ubuntu:18.04
MAINTAINER Stephen Ramsey (stephen.ramsey@oregonstate.edu)
RUN useradd ubuntu -m -s /bin/bash
RUN apt-get update
RUN apt-get install -y git sudo
RUN echo "ubuntu:ubuntu" | chpasswd
RUN sudo adduser ubuntu
COPY * /home/ubuntu/RTX/code/kg2/
RUN su - ubuntu -c "cd /home/ubuntu && /home/ubuntu/RTX/code/kg2/setup-kg2.sh"
