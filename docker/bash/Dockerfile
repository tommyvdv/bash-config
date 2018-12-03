FROM debian:jessie
LABEL maintainer="Tommy <fommy@gmail.com>"
RUN echo "Install dependencies" \
  && apt-get --assume-yes update \
  && apt-get --assume-yes install \
    git \
    tree \
    vim
RUN echo "Perform cleanup" \
  && apt-get clean \
  && rm -rf /root/.bashrc /root/.profile /var/lib/apt/lists/* \
  && find /tmp/ -maxdepth 1 -mindepth 1 -exec rm -rf {} \;
RUN echo "Install ssh directory structure" \
  && mkdir -p /root/.ssh/conf.d \
  && chmod 700 /root/.ssh \
  && touch /root/.ssh/config /root/.ssh/conf.d/default.conf /root/.ssh/known_hosts \
  # Introduced with version 7.3: https://www.openssh.com/txt/release-7.3
  # @todo: Find a way to upgrade this son'bich.
#   && echo '# Include config files.\n\
# Include conf.d/*\n' > /root/.ssh/config \
  && echo 'Host github.com\n\
  User git\n\
  Hostname github.com\n\
  PreferredAuthentications publickey\n\
  Port 22\n\
  IdentityFile /root/.ssh/id_rsa\n' > /root/.ssh/config \
  # IdentityFile /root/.ssh/id_rsa\n' > /root/.ssh/conf.d/github.com.conf \
  # Generate a wildly insecure key-pair;
  && ssh-keygen -b 4096 -t rsa -C "email@adres.com" -f /root/.ssh/id_rsa -q -N "" \
  && ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts
  # @todo: This shouldn't fail; but it does; Find out why.
  # && ssh -T git@github.com
  # @todo: some tricks
  # eval "$(ssh-agent -s)" && ssh-add && ssh -T git@github.com && git submodule init && git submodule update
RUN mkdir -p /root/tmp
COPY repo.bundle /root/tmp/repo.bundle
RUN echo "Clone repository from bundled repository" \
  && cd /root \
  && git init \
  && git remote add origin /root/tmp/repo.bundle \
  && git pull origin master
  # @todo: This shouldn't fail; but it does; Find out why.
  # && git submodule init \
  # && git submodule update
COPY .bash/lib /root/.bash/lib

RUN echo "Carrying out tasks you should do manually" \
  && cd /root \
  && cp .bash/git/.gitconfig-user.dist .bash/git/.gitconfig-user
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
RUN echo "Resulting $HOME directory structure:" \
  && cd /root \
  && tree -a -L 2
RUN echo "Resulting submodules:" \
  && cd /root \
  && tree -a -L 1 .bash/lib
WORKDIR /root
