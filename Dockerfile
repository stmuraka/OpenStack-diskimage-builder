FROM ubuntu:trusty
MAINTAINER Shaun Murakami <stmuraka@us.ibm.com>

RUN apt-get -y update \
 && apt-get -y install \
        git \
        curl \
        python \
        qemu-utils \
        uuid-runtime \
        parted \
        kpartx \
# Cleanup package files
 && apt-get autoremove  \
 && apt-get autoclean

WORKDIR /root/
RUN git clone https://git.openstack.org/openstack/diskimage-builder \
 && git clone https://git.openstack.org/openstack/dib-utils

ENV PATH=$PATH:/root/diskimage-builder/bin:/root/dib-utils/bin

# Install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py \
 && python get-pip.py

RUN pip install diskimage-builder

ENTRYPOINT ["disk-image-create"]
CMD ["--help"]
