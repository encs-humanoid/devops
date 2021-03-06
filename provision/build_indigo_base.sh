#!/usr/bin/env bash

# based on the install procedure from http://wiki.ros.org/indigo/Installation/Ubuntu

echo "Setting timezone..."
cp /usr/share/zoneinfo/America/New_York /etc/localtime
echo

echo "Getting the ROS latest list..."
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
echo

echo "Adding the ROS key..."
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
echo

echo "Updating the package list..."
apt-get update
echo

# for ROS base:
echo "Installing the ROS Indigo base..."
apt-get -y install ros-indigo-ros-base
echo

apt-cache search ros-indigo

echo "Running rosdep init..."
rosdep init
echo

echo "Running rosdep update as vagrant user..."
su - vagrant <<END
rosdep update
END
echo

echo "Adding the ROS setup to the vagrant user's bashrc..."
cat >> /home/vagrant/.bashrc <<END

# always source the ROS setup
source /opt/ros/indigo/setup.bash

# set local ROS-related environment variables
if [ -f /vagrant/ros_local.cfg ]; then
    source /vagrant/ros_local.cfg
fi
END

source /home/vagrant/.bashrc
echo

echo "Installing python-rosinstall..."
apt-get -y install python-rosinstall
echo

echo "Installing needed extras..."
apt-get -y install make git
echo

# add anything you think should be available on the box
echo "Installing extras..."
apt-get -y install tree mg screen
echo
echo "ROS install completed."
echo
