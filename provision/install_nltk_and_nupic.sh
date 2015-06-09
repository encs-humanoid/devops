#!/bin/bash

#===================================================================
# Script to install NLTK 3.0 and Nupic
# Intended for use on Ubuntu 14.04 LTS, x86_64
#
# Copyright 2015, IEEE ENCS Humanoid Robot Project
#===================================================================

cat /vagrant/install_nltk.sh > /root/provision.sh

cat /vagrant/install_nupic.sh >> /root/provision.sh

sh /root/provision.sh
