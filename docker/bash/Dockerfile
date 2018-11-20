FROM debian:jessie
LABEL maintainer="Tommy <fommy@gmail.com>"
RUN echo "install dependencies" \
  && apt-get --assume-yes update \
  && apt-get --assume-yes install \
    git \
    tree
COPY .bash /root/.bash
COPY .bash_profile /root/.bash_profile
COPY .bashrc /root/.bashrc
COPY .gitconfig /root/.gitconfig
COPY .gitignore-global /root/.gitignore-global
COPY .gitconfig-user.dist /root/.gitconfig-user
COPY .gitconfig-alias /root/.gitconfig-alias
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
RUN echo "Install git fixture" \
  && mkdir -p /root/projects/gitproject \
  && cd /root/projects/gitproject \
  && git init \
  && touch .gitignore readme.md \
  && git add --all \
  && git commit -m 'initial commit of a fixture repository'
RUN echo "cleanup" \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && find /tmp/ -maxdepth 1 -mindepth 1 -exec rm -rf {} \;
RUN echo "$HOME directory structure:" \
  && cd /root \
  && tree -a -L 2
WORKDIR /root
