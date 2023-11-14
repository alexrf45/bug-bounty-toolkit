# latest bounty base image
FROM kalilinux/kali-rolling:latest

LABEL "project"="bug-bounty-toolkit"
LABEL "author"="f0nzy"
LABEL "version"="v1.0.0"
LABEL "website"="https://f0nzy.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install sudo

RUN groupadd --gid 1000 bounty \
  && useradd --home-dir /home/bounty --create-home --uid 1000 \
  --gid 1000 --shell /bin/bash --skel /dev/null bounty

RUN chown -R bounty:bounty /home/bounty/

RUN echo bounty:bounty | chpasswd

RUN usermod -aG sudo bounty

RUN echo 'bounty  ALL=(ALL) NOPASSWD:ALL' >>  /etc/sudoers.d/bounty

WORKDIR /home/bounty/

USER bounty

RUN mkdir .logs && mkdir -p .local/bin && mkdir .local/tools

ADD sources/base.sh /tmp/sources/base.sh

RUN sudo chmod +x /tmp/sources/base.sh && /tmp/sources/base.sh

ADD sources/tools.sh /tmp/sources/tools.sh

RUN sudo chmod +x /tmp/sources/tools.sh && /tmp/sources/tools.sh

RUN sudo chown -R bounty:bounty /tmp/sources/*

ADD resources/hakrawler /tmp/sources/hakrawler

ADD resources/jsleak /tmp/sources/jsleak

RUN cp /tmp/sources/hakrawler /home/bounty/.local/bin/hakrawler \
  && chmod +x /home/bounty/.local/bin/hakrawler && \
  cp /tmp/sources/jsleak /home/bounty/.local/bin/jsleak && chmod +x /home/bounty/.local/bin/jsleak


ADD resources /home/bounty/resources/

RUN sudo chown -R bounty:bounty /home/bounty/resources

RUN cp /home/bounty/resources/tmux.conf /home/bounty/.tmux.conf \
  && cp -r /home/bounty/resources/recon.sh /home/bounty/.local/bin/recon.sh && \
  chmod +x /home/bounty/.local/bin/recon.sh && \
  cp /home/bounty/resources/bash/bashrc /home/bounty/.bashrc && \
  cp /home/bounty/resources/bash/bash_profile /home/bounty/.bash_profile && \
  cp /home/bounty/resources/bash/bash_aliases /home/bounty/.bash_aliases && \
  cp /home/bounty/resources/bash/history /home/bounty/.history

RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

RUN sudo rm -rf /tmp/sources && sudo rm -rf /home/bounty/resources

USER bounty

RUN bash



