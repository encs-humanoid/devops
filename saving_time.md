ENCS Humanoid / Devops
======

Configuration management for ROS/Linux machine instances, using Vagrant for development

## Saving Time When Bringing Up Vagrant Boxes

Because our Vagrantfiles will tell Vagrant to pull a generic Ubuntu box and then install ROS packages, you can wait quite a long time, especially on a slower network.

### Easiest Solution

At team meetings, Mark Whelan will bring pre-packaged Vagrant boxes on a flash drive and also make them available on his laptop via web download. At this time the options are a ROS full desktop VM, a ROS full desktop VM plus Nupic and NLTK, and a ROS base VM.

Copy the box you want to your computer, and on a command line run

```sh
vagrant box add <box-name>.box --name <box-name>
```

Now you can reuse this box in your project. To do this, change your Vagrantfile. First, change the line

```sh
config.vm.box = "box-cutter/ubuntu1204-desktop"
```

to 

```sh
config.vm.box = "<box-name>"
```

Also, be sure to comment out or delete the line that begins

```sh
config.vm.provision :shell, path: ...
```

Now you can run "vagrant up" after destroying a box, and it will start almost immediately without downloading or provisioning.

<hr>
### Alternative Solution (if you don't want to wait for a team meeting)

After you have brought up one of our ROS VMs, it is possible to repackage it into a local Vagrant box on your own computer. If you do this, and then change your Vagrantfile to pull the local box, you will no longer have to wait for the network or for a complete ROS install when you run "vagrant up"; you'll just have a ROS VM instantly ready.

Here are the steps:

[Follow the original instructions for bringing up a ROS box](README.md) on your platform.

If you are using one of the full desktop VMs, you will want to put <a href="https://raw.githubusercontent.com/encs-humanoid/devops/master/ros_desktop.config">this box configuration file</a> into your directory.

On a command line, within your vagrant/code directory, run

```sh
vagrant package --output <my-ros-box-name>.box --vagrantfile ros-desktop.config
```

After completion, you should have a box file in your vagrant directory.

Import this box into your local vagrant box library by running this command:

```sh
vagrant box add <my-ros-box-name>.box --name <my-ros-box-name>
```

You can delete the box file and the ros-desktop.config file from your vagrant/code directory at this point, if you want. Copies have been stored elsewhere.

Now, at last, you can reuse the box in your project. To do this, change your Vagrantfile.

First, change the line 

```sh
config.vm.box = "box-cutter/ubuntu1204-desktop"
```

to 

```sh
config.vm.box = "<box-name>"
```

Also, be sure to comment out or delete the line that begins

```sh
config.vm.provision :shell, path: ...
```

Now you can run "vagrant up" after destroying a box, and it will start almost immediately without provisioning or downloading.



