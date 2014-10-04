#!/usr/bin/env bash

# based on the install procedure from http://wiki.ros.org/hydro/Installation/Ubuntu

echo "Setting timezone..."
cat > /etc/timezone <<EOF
America/New_York
EOF

echo "Getting the ROS latest list..."
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
echo

echo "Adding the ROS key..."
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | apt-key add -
echo

echo "Updating the package list..."
# next, avoid hddtemp prompt
echo "hddtemp hddtemp/daemon boolean false" | debconf-set-selections
apt-get -y update
echo

# for ROS full desktop:
echo "Installing the ROS Hydro full desktop..."
apt-get -y install ros-hydro-desktop-full
echo

apt-cache search ros-hydro

echo "Running rosdep init..."
rosdep init
echo

echo "Running rosdep update as vagrant user..."
su - vagrant <<EOF
rosdep update
EOF
echo

echo "Adding the ROS setup to the vagrant user's bashrc..."
echo "source /opt/ros/hydro/setup.bash" >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc
echo

echo "Installing python-rosinstall..."
apt-get -y install python-rosinstall
echo

# This will work, but 3D programs will be very slow
echo "Enabling temporary workaround for 3D programs..."
echo "export LIBGL_ALWAYS_SOFTWARE=1" >> /etc/bash.bashrc
echo

echo "Installing make..."
apt-get -y install make
echo

# # rosjava

# echo "Installing rosjava..."
# apt-get install ros-hydro-catkin ros-hydro-ros ros-hydro-rosjava python-wstool
# echo

# add anything you think should be available on the box
echo "Installing extras..."
apt-get -y install tree mg screen
echo
echo "ROS install completed."
echo
