FROM registry.access.redhat.com/ubi9

RUN sed -i 's/\(def in_container():\)/\1\n    return False/g' /usr/lib64/python*/*-packages/rhsm/config.py

RUN yum update -y && yum install git sudo wget zsh -y
RUN groupadd -g 911 sudo
RUN useradd -G sudo -ms /bin/zsh vscode
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER vscode
