#!/bin/bash

#===================================================================
# Script to install Nupic
# Intended for use on Ubuntu 12.04 LTS, x86_64
#
# Copyright 2014, IEEE ENCS Humanoid Robot Project
#===================================================================

echo "Installing prerequisites for Nupic..."
sudo apt-get update -y
sudo apt-get install git python-setuptools python-dev python-pip automake libtool libssl-dev g++ cmake libpcre3-dev -y
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -y install mysql-server
echo

echo "Upgrading to GCC 4.7..."
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update -y
sudo apt-get install gcc-4.7 g++-4.7 -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.7 40 --slave /usr/bin/g++ g++ /usr/bin/g++-4.7
yes '2' | sudo update-alternatives --config gcc

echo "Cloning Nupic repo..."
git clone https://github.com/numenta/nupic.git $HOME/nupic
echo

echo "Setting up for a Nupic build..."
sudo -E pip install -r $HOME/nupic/external/common/requirements.txt
echo

echo "Building Nupic..."
cd $HOME/nupic
sudo python setup.py install
echo

echo "Ready. To test, import nupic in python."
echo
