
ARG RHEL_VERSION=8

FROM registry.access.redhat.com/ubi${RHEL_VERSION}/ubi:latest
ARG RHEL_VERSION

RUN yum install -y "https://dl.fedoraproject.org/pub/epel/epel-release-latest-${RHEL_VERSION}.noarch.rpm" && \
yum install -y "https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-${RHEL_VERSION}.noarch.rpm"

RUN sed -i 's/\(def in_container():\)/\1\n    return False/g' /usr/lib64/python*/*-packages/rhsm/config.py
RUN yum update -y && yum install bash gdb strace git yum-utils -y
# Install development tools and createrepo
RUN yum -y update && \
    yum -y install \
    gcc \
    gcc-c++ \
    make 

# Clean up Yum cache
RUN yum clean all

# Create a non-root user and add sudo support
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN yum update -y && yum install git sudo wget zsh -y
RUN groupadd -g 911 sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Disable subscription manager
RUN sed -i 's/enabled=1/enabled=0/' /etc/yum/pluginconf.d/subscription-manager.conf
USER vscode
