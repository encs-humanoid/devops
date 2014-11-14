#!/usr/bin/env bash

based on the install procedure from http://wiki.ros.org/hydro/Installation/Ubuntu

echo "Setting timezone..."
sudo cp /usr/share/zoneinfo/America/New_York /etc/localtime
echo

echo "Getting the ROS latest list..."
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
echo

echo "Adding the ROS key..."
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
echo

echo "Updating the package list..."
# next, avoid hddtemp prompt
echo "hddtemp hddtemp/daemon boolean false" | debconf-set-selections
sudo apt-get -y update
echo

# for ROS full desktop:
echo "Installing the ROS Hydro full desktop..."
sudo apt-get -y install ros-hydro-desktop-full
echo

sudo apt-cache search ros-hydro

echo "Running rosdep init..."
sudo rosdep init
echo

USER=`whoami`
echo "Running rosdep update as $USER..."
#su - $USER <<END
rosdep update
#END
echo

echo "Adding the ROS setup to $USER's bashrc..."
cat >> $HOME/.bashrc <<END

# always source the ROS setup
source /opt/ros/hydro/setup.bash
END

if [ -d /vagrant ];then

cat >> $HOME/.bashrc <<END

# set local ROS-related environment variables
if [ -f /vagrant/ros_local.cfg ]; then
    source /vagrant/ros_local.cfg
fi
END

fi

source $HOME/.bashrc
echo

echo "Installing python-rosinstall..."
sudo apt-get -y install python-rosinstall
echo

# Next section is a hack to let some 3D programs work under Virtualbox
# when device drivers aren't working correctly.
# This will work, but 3D programs will be very slow.
#echo "Enabling temporary workaround for 3D programs..."
#echo "export LIBGL_ALWAYS_SOFTWARE=1" >> /etc/bash.bashrc
#echo

echo "Installing needed extras..."
sudo apt-get -y install make git
echo

# # rosjava

# echo "Installing rosjava..."
# apt-get install ros-hydro-catkin ros-hydro-ros ros-hydro-rosjava python-wstool
# echo

# add anything you think should be available on the box
echo "Installing extras..."
sudo apt-get -y install tree mg screen
echo
echo "ROS install completed."
echo
