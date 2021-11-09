#!/bin/bash
# Downloading Proxmox LXC templates
# sean helmus

# update available images

# get available images and set the ones to download
DEBIAN=${pveam available | grep debian-10-standard | awk -F' ' '{print $}'}
ARCH=${pveam available | grep archlinux | awk -F' ' '{print $2}'}
CENT=${pveam available | grep centos-8-default | awk -F' ' '{print $2}'}

# download images
pveam download local $DEBIAN
pveam download local $ARCH
pveam download local $CENT
