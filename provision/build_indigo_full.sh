#!/bin/bash

# based on the install procedure from http://wiki.ros.org/indigo/Installation/Ubuntu

export CURRENT_USER=`whoami`
if getent passwd vagrant > /dev/null 2>&1; then
# we have a vagrant user
  export USING_VAGRANT=1
fi

if [ $CURRENT_USER == 'root' -a $USING_VAGRANT ]; then
  export USER=vagrant
  export HOMEDIR=/home/vagrant
else
  export USER=$CURRENT_USER
  export HOMEDIR=$HOME
fi

echo "Setting up ROS for $USER with home $HOMEDIR..."
echo

echo "Setting timezone..."
sudo cp /usr/share/zoneinfo/America/New_York /etc/localtime
echo

echo "Getting the ROS latest list..."
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
echo

echo "Adding the ROS key..."
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
echo

echo "Updating the package list..."
# next, avoid hddtemp prompt
echo "hddtemp hddtemp/daemon boolean false" | sudo debconf-set-selections
sudo apt-get -y update
echo

# for ROS full desktop:
echo "Installing the ROS Indigo full desktop..."
sudo apt-get -y install ros-indigo-desktop-full
echo

sudo apt-cache search ros-indigo

echo "Running rosdep init..."
sudo rosdep init
echo

echo "Running rosdep update as $CURRENT_USER..."
sudo -u $CURRENT_USER rosdep update
echo

echo "Adding the ROS setup to $CURRENT_USER's bashrc..."
cat >> $HOMEDIR/.bashrc <<END

# always source the ROS setup
source /opt/ros/indigo/setup.bash
END

if [ $USING_VAGRANT ];then

cat >> $HOMEDIR/.bashrc <<END

# set local ROS-related environment variables
if [ -f /vagrant/ros_local.cfg ]; then
    source /vagrant/ros_local.cfg
fi
END

fi

source $HOMEDIR/.bashrc

echo "Installing python-rosinstall..."
sudo apt-get -y install python-rosinstall
echo

# Next section is a hack to let some 3D programs work under Virtualbox
# when device drivers aren't working correctly.
# This will work, but 3D programs will be very slow.
if [ $USING_VAGRANT ]; then
  echo "Enabling temporary workaround for 3D programs on Virtualbox..."
  sudo bash -c 'echo "export LIBGL_ALWAYS_SOFTWARE=1" >> /etc/bash.bashrc'
  echo
fi

echo "Installing needed extras..."
sudo apt-get -y install make git
echo

# # rosjava

# echo "Installing rosjava..."
# apt-get install ros-indigo-catkin ros-indigo-ros ros-indigo-rosjava python-wstool
# echo

# add anything you think should be available on the box
echo "Installing extras..."
sudo apt-get -y install tree mg screen
echo

echo "ROS install completed."
echo
