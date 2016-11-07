#!/bin/bash

# Ubuntu image
docker run --rm --privileged -v $(pwd)/images:/root/images diskimage-builder -o /root/images/ubuntu ubuntu vm

# Fedora image
docker run --rm --privileged -v $(pwd)/images:/root/images diskimage-builder -o /root/images/fedora fedora vm
