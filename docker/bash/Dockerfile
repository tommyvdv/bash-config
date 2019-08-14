FROM debian:jessie
LABEL maintainer="Tommy <fommy@gmail.com>"
RUN echo "Install dependencies" \
  && apt-get --assume-yes update \
  && apt-get --assume-yes install \
    git \
    tree \
    vim \
    bc
RUN echo "Perform cleanup" \
  && apt-get clean \
  && rm -rf /root/.bashrc /root/.profile /var/lib/apt/lists/* \
  && find /tmp/ -maxdepth 1 -mindepth 1 -exec rm -rf {} \;
RUN echo "Install ssh directory structure" \
  && mkdir -p /root/.ssh/conf.d \
  && chmod 700 /root/.ssh \
  && touch /root/.ssh/config /root/.ssh/conf.d/default.conf /root/.ssh/known_hosts \
  && echo '# Introduced with version 7.3: https://www.openssh.com/txt/release-7.3\n\
  # Current version of this container is:\n\
  # OpenSSH_6.7p1 Debian-5+deb8u8, OpenSSL 1.0.1t  3 May 2016\n\
  # Include ~/.ssh/conf.d/*\n\
  \n\
  Host github.com\n\
  User git\n\
  Hostname github.com\n\
  PreferredAuthentications publickey\n\
  Port 22\n\
  IdentityFile /root/.ssh/id_rsa\n' > /root/.ssh/config \
  # Generate a wildly insecure key-pair without a passphrase;
  && ssh-keygen -b 4096 -t rsa -C "email@adres.com" -f /root/.ssh/id_rsa -q -N "" \
  && ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts
  # @solved: Generating a key-pair works great as an example but fails at github
  # because the key isn't (yet) associated to a github account. This is simply
  # due to the fact our key isn't found in the authorized_hosts construct.
  # The only way around this is using HTTPS based module URLs.
RUN mkdir -p /root/tmp
COPY repo.bundle /root/tmp/repo.bundle
RUN echo "Clone repository from bundled repository" \
  && cd \
  && git clone --recurse-submodules /root/tmp/repo.bundle bash-config

RUN echo "Carrying out tasks you should do manually" \
  && cd \
  && cp bash-config/.bash/git/.gitconfig-user.dist bash-config/.bash/git/.gitconfig-user
RUN echo "Install project fixtures" \
  && mkdir -p /root/projects/projectA /root/projects/projectB /root/projects/projectC
RUN echo "Install host fixtures" \
  && echo "127.0.0.1	project_a.localhost" >> /etc/hosts \
  && echo "127.0.0.1	project_b.localhost" >> /etc/hosts \
  && echo "127.0.0.1	project_c.localhost" >> /etc/hosts
RUN echo "Resulting $HOME directory structure:" \
  && cd \
  && tree -a -L 2
RUN echo "Resulting submodules:" \
  && cd \
  && tree -a -L 1 bash-config/.bash/lib
RUN echo "Pretend user already has some bash related files:" \
  && cd \
  && touch .bashrc .bash_profile .inputrc .someotherfile

RUN echo "Use install script:" \
  && cd \
  && bash-config/bin/install.sh

RUN echo "Install git fixture" \
  && mkdir -p /root/projects/gitproject \
  && cd /root/projects/gitproject \
  && git init \
  && touch .gitignore readme.md \
  && git add --all \
  && git commit -m 'initial commit of a fixture repository'

WORKDIR /root
