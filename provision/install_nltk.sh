#!/bin/bash

#===================================================================
# Script to install NLTK 3.0
# Intended for use on Ubuntu 14.04 LTS, x86_64
#
# Copyright 2015, IEEE ENCS Humanoid Robot Project
#===================================================================

echo "Installing useful extra packages..."
sudo apt-get update -y
sudo apt-get install expect-dev git -y
echo

echo "Installing NLTK prerequisites..."
sudo apt-get install python-setuptools -y
sudo easy_install pip
sudo pip install -U numpy
echo

echo "Installing NLTK..."
sudo pip install -U nltk
echo

echo "Installing NLTK Data..."
sudo python -m nltk.downloader -d /usr/share/nltk_data all
echo

echo 'Ready. To test, "import nltk" in python.'
echo
