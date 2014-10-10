ENCS Humanoid / Devops
======

Configuration management for ROS/Linux machine instances, using Vagrant for development

### What is Vagrant?

You probably already use virtual machines in your work, either in the cloud or on your own computer so that you can encapsulate a server into a convenient object that can be cloned, updated, distributed easily, and your operating system can be version-controlled much like the software in your other projects. This means several developers can each have a personal copy of the platform that will be used in production deployment, down to configurations and packages. And this is a boon: much time will be saved when the different pieces of a project don't have to clash because they were developed on slightly different platforms.

So, if your team members each develop against copies of the same platform, you win.

So what is Vagrant? Vagrant takes care of much of the grunt work of farming VMs, so that you can develop your robot, your vision system, your AI, and waste less time configuring and copying VMs around. 

Vagrant leverages VirtualBox, and on top of it:

+ Let's you download a box from the net and boot it with one command.
+ The VM can provision itself, installing or updating the latest packages when you build it.
+ The VM will contain a directory that you can access from your host operating system. You can use your favorite Windows/Mac/Linux tools from that host, to edit and develop the software that runs on the VM while simultaneously running that software in the VM. In this way the things that change - your project code files - are kept out of and separated from the VM that runs the software. You can trash the box and rebuild it without your project being touched.

### Specifics for the Humanoid Project

The VMs we will work with contain Ubuntu 12.04 LTS, on x86_64, with ROS Hydro. The current VMs can be considered alpha, so please chime in with ideas and constructive criticisms. At this time there are two choices: a base ROS Hydro box without a desktop, and a full ROS Hydro desktop box. We can run multiple VMs in communication with one another, as in a distributed ROS system with different machines for different supporting tasks.

### Quick Start

##### Preparing your machine for development with a ROS VM</em>

+ Install <a href="https://www.virtualbox.org">Virtualbox</a>.
+ After you have Virtualbox, install <a href="http://www.vagrantup.com">Vagrant</a>.

##### Developing your ROS code with a Vagrant VM

[Instructions for Windows](Windows_Instructions.md)

[Instructions for Macintosh and Linux](MacLinux_Instructions.md)

[Saving Time by Repackaging a Vagrant Box](saving_time.md)

Instructions for a physical machine (pending)

### License

pending...
