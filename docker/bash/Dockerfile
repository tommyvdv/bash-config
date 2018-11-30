FROM debian:jessie
LABEL maintainer="Tommy <fommy@gmail.com>"
COPY .bash /root/.bash
COPY .bash_profile /root/.bash_profile
COPY .bashrc /root/.bashrc
COPY bin /root/bin
RUN echo "Install ssh directory structure" \
  && mkdir -p /root/.ssh/conf.d \
  && touch /root/.ssh/config /root/.ssh/conf.d/default.conf
RUN echo "Install project fixtures" \
  && mkdir -p /root/projects/projectA /root/projects/projectB /root/projects/projectC
RUN echo "Install host fixtures" \
  && echo "127.0.0.1	project_a.localhost" >> /etc/hosts \
  && echo "127.0.0.1	project_b.localhost" >> /etc/hosts \
  && echo "127.0.0.1	project_c.localhost" >> /etc/hosts
WORKDIR /root
