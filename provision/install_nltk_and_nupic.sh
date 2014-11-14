#!/bin/bash

#===================================================================
# Script to install NLTK and Nupic for our experimentation.
# Intended for use on Ubuntu 12.04 LTS, x86_64
#
# Copyright 2014, IEEE ENCS Humanoid Robot Project
#===================================================================

echo "Installing useful extra packages..."
sudo apt-get install expect-dev -y
echo

echo "Installing NLTK prerequisites..."
sudo easy_install pip
sudo pip install -U numpy
echo

echo "Installing NLTK..."
sudo pip install -U nltk
echo

echo "Installing NLTK Data..."
sudo python -m nltk.downloader -d /usr/share/nltk_data all
echo

echo "Installing prerequisites for Nupic..."
sudo apt-get install git python-dev python-pip automake libtool libssl-dev g++ cmake mysql-server libpcre3-dev -y

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
export NUPIC=$HOME/nupic
#sudo pip install --user -r $NUPIC/external/common/requirements.txt
sudo pip install -r $NUPIC/external/common/requirements.txt
echo

echo "Building Nupic..."
cd $NUPIC
#sudo python setup.py install --user
sudo python setup.py install
echo

echo "Ready."
echo
