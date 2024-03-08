FROM registry.access.redhat.com/ubi9
RUN yum update -y && yum install git sudo wget zsh -y
RUN groupadd -g 911 sudo
RUN useradd -G sudo -ms /bin/zsh vscode
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER vscode
