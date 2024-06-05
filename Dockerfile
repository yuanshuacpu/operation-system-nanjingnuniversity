FROM ubuntu:22.04 as builder

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y build-essential gcc-multilib qemu-system strace gdb sudo python3 libsdl2-dev libreadline-dev  llvm-11  gcc g++ gedit

RUN apt-get install -y openssh-server  openssh-client
RUN echo 'RSAAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
# RUN /etc/init.d/ssh restart
ARG user=user
RUN useradd --create-home --no-log-init --shell /bin/bash ${user} \
    && adduser ${user} sudo \
    && echo "${user}:123456" | chpasswd

USER user
RUN echo 'export AM_HOME=/home/code/my-mechine/abstract-machine' >> /home/user/.bashrc
RUN echo 'echo '123456' | sudo /etc/init.d/ssh restart' >> /home/user/.bashrc
WORKDIR /home/user

FROM operation-learning:lastest as later
