FROM debian:jessie
LABEL maintainer="Tommy <fommy@gmail.com>"
COPY .bash /root/.bash
COPY .bash_profile /root/.bash_profile
COPY .bashrc /root/.bashrc
RUN echo "Install ssh directory structure" \
  && mkdir -p /root/.ssh/conf.d \
  && touch /root/.ssh/config /root/.ssh/conf.d/default.conf
RUN echo "Install project directory structure" \
  && mkdir -p /root/projects/projectA /root/projects/projectB /root/projects/projectC
WORKDIR /root
